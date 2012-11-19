require "spec_helper"
require "heroku/helpers/heroku_postgresql"

include Heroku::Helpers::HerokuPostgresql

describe Heroku::Helpers::HerokuPostgresql do

  before do
    subject.stub(:app_config_vars) { app_config_vars }
    subject.stub(:app_attachments) { app_attachments }
  end

  let(:app_config_vars) do
    {
      "DATABASE_URL"                => "postgres://default",
      "HEROKU_POSTGRESQL_BLACK_URL" => "postgres://black",
      "HEROKU_POSTGRESQL_IVORY_URL" => "postgres://default",
      "SHARED_DATABASE_URL"         => "postgres://shared"
    }
  end

    let(:app_attachments) {
      [ Attachment.new({ 'config_var' => 'HEROKU_POSTGRESQL_IVORY_URL',
          'resource' => {'name'  => 'softly-mocking-123',
                         'value' => 'postgres://default',
                         'type'  => 'heroku-postgresql:baku' }}),
        Attachment.new({ 'config_var' => 'HEROKU_POSTGRESQL_BLACK_URL',
          'resource' => {'name'  => 'quickly-yelling-2421',
                         'value' => 'postgres://black',
                         'type'  => 'heroku-postgresql:zilla' }})
      ]
    }

  it "resolves DATABASE" do
    att = subject.hpg_resolve('DATABASE')
    att.display_name.should == "HEROKU_POSTGRESQL_IVORY_URL (DATABASE_URL)"
    att.url.should == "postgres://default"
  end

  it "resolves SHARED_DATABASE" do
    att = subject.hpg_resolve('SHARE_DATABASE')
    att.display_name.should == "SHARED_DATABASE"
    att.url.should == "postgres://shared"
  end

  it "resolves default using NAME" do
    att = subject.hpg_resolve('IVORY')
    att.display_name.should == "HEROKU_POSTGRESQL_IVORY_URL (DATABASE_URL)"
    att.url.should == "postgres://default"
  end

  it "resolves non-default using NAME" do
    att = subject.hpg_resolve('BLACK')
    att.display_name.should == "HEROKU_POSTGRESQL_BLACK_URL"
    att.url.should == "postgres://black"
  end

  it "resolves default using NAME_URL" do
    att = subject.hpg_resolve('IVORY_URL')
    att.display_name.should == "HEROKU_POSTGRESQL_IVORY_URL (DATABASE_URL)"
    att.url.should == "postgres://default"
  end

  it "resolves non-default using NAME_URL" do
    att = subject.hpg_resolve('BLACK_URL')
    att.display_name.should == "HEROKU_POSTGRESQL_BLACK_URL"
    att.url.should == "postgres://black"
  end

  it "resolves default using lowercase" do
    att = subject.hpg_resolve('ivory')
    att.display_name.should == "HEROKU_POSTGRESQL_IVORY_URL (DATABASE_URL)"
    att.url.should == "postgres://default"
  end

  it "resolves non-default using lowercase" do
    att = subject.hpg_resolve('black')
    att.display_name.should == "HEROKU_POSTGRESQL_BLACK_URL"
    att.url.should == "postgres://black"
  end

  it "resolves non-default using part of name" do
    att = subject.hpg_resolve('bla')
    att.display_name.should == "HEROKU_POSTGRESQL_BLACK_URL"
    att.url.should == "postgres://black"
  end

  it "throws an error if it doesnt exist" do
    subject.should_receive(:error).with("Unknown database: violet. Valid options are: DATABASE_URL, HEROKU_POSTGRESQL_BLACK_URL, HEROKU_POSTGRESQL_IVORY_URL, SHARED_DATABASE")
    subject.hpg_resolve("violet")
  end

  context "default" do

    it "errors if there is no default" do
      subject.should_receive(:error).with("Unknown database. Valid options are: DATABASE_URL, HEROKU_POSTGRESQL_BLACK_URL, HEROKU_POSTGRESQL_IVORY_URL, SHARED_DATABASE")
      subject.hpg_resolve(nil)
    end

    it "uses the default if nothing specified" do
      att = subject.hpg_resolve(nil, "DATABASE_URL")
      att.display_name.should == "HEROKU_POSTGRESQL_IVORY_URL (DATABASE_URL)"
      att.url.should == "postgres://default"
    end

  end
end
