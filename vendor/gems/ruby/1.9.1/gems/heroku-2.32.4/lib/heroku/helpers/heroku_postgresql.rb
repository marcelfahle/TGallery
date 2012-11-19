require "heroku/helpers"

module Heroku::Helpers::HerokuPostgresql

  extend self
  extend Heroku::Helpers

  class Attachment
    attr_reader :config_var, :resource_name, :url, :addon, :plan
    def initialize(raw)
      @raw = raw
      @config_var    = raw['config_var']
      @resource_name = raw['resource']['name']
      @url           = raw['resource']['value']
      @addon, @plan  = raw['resource']['type'].split(':')
    end

    def starter_plan?
      plan =~ /dev|basic/
    end

    def display_name
      config_var + (primary_attachment? ? " (DATABASE_URL)"  : '')
    end

    def primary_attachment!
      @primary_attachment = true
    end

    def primary_attachment?
      @primary_attachment
    end
  end

  def hpg_addon_name
    if ENV['SHOGUN']
      "shogun-#{ENV['SHOGUN']}"
    else
      ENV['HEROKU_POSTGRESQL_ADDON_NAME'] || 'heroku-postgresql'
    end
  end

  def app_config_vars
    @app_config_vars ||= api.get_config_vars(app).body
  end

  def app_attachments
    @app_attachments ||= api.get_attachments(app).body.map { |raw| Attachment.new(raw) }
  end

  def hpg_databases
    return @hpg_databases if @hpg_databases
    pairs = app_attachments.select {|att|
        att.addon == hpg_addon_name
      }.map { |att|
        [att.config_var, att]
      }
    @hpg_databases = Hash[ pairs ]

    if find_database_url_real_attachment
      @hpg_databases['DATABASE_URL'] = find_database_url_real_attachment
    end

    if app_config_vars['SHARED_DATABASE_URL']
      @hpg_databases['SHARED_DATABASE'] = Attachment.new({
        'config_var' => 'SHARED_DATABASE',
        'resource' => {
            'name'  => 'SHARED_DATABASE',
            'value' => app_config_vars['SHARED_DATABASE_URL'],
            'type'  => 'shared:database'
          }
        })
    end

    return @hpg_databases
  end

  def resource_url(resource)
    api.get_resource(resource).body['value']
  end

  def forget_config!
    @hpg_databases   = nil
    @app_config_vars = nil
  end

  def find_database_url_real_attachment
    primary_db_url = app_config_vars['DATABASE_URL']
    return unless primary_db_url

    real_config = app_config_vars.detect {|k,v| k != 'DATABASE_URL' && v == primary_db_url }
    if real_config
      real = hpg_databases[real_config.first]
      real.primary_attachment! if real
      return real
    else
      return nil
    end
  end

  def match_attachments_by_name(name)
     return [name] if hpg_databases[name]
     hpg_databases.keys.grep(%r{#{ name.split(//).join('\w*') }}i)
  end

  def hpg_resolve(name, default=nil)
    name = '' if name.nil?
    name = 'DATABASE_URL' if name == 'DATABASE'

    if hpg_databases.empty?
      error("Your app has no databases.")
    end

    canidates = match_attachments_by_name(name)
    if canidates.size == 1
      hpg_databases[canidates.first]
    elsif default && name.empty? && app_config_vars[default]
      hpg_databases[default]
    else
      error("Unknown database#{': ' + name unless name.empty?}. Valid options are: #{hpg_databases.keys.sort.join(", ")}")
    end
  end

  def hpg_translate_fork_and_follow(addon, config)
    if addon =~ /^#{hpg_addon_name}/
      %w[fork follow].each do |opt|
        if val = config[opt]
          unless val.is_a?(String)
            error("--#{opt} requires a database argument")
          end

          uri = URI.parse(val) rescue nil
          if uri && uri.scheme
            argument_url = uri.to_s
          else
            attachment = hpg_resolve(val)
            argument_url = attachment.url
          end

          config[opt] = argument_url
        end
      end
    end
  end

  private

  def hpg_promote(url)
    api.put_config_vars(app, "DATABASE_URL" => url)
  end

end
