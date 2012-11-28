#!/usr/bin/env ruby
require 'rubygems'
require 'bundler/setup'
require 'mailman'
require 'net/imap'


Mailman.config.ignore_stdin = true
Mailman.config.logger = Logger.new File.expand_path("../../log/mailman.log", __FILE__)
Mailman.config.poll_interval = 20
Mailman.config.pop3 = {
  server:   "steelpuck.com", 
  port:     110, 
  ssl:      false,
  username: "test@steelpuck.com",
  password: "testtest"
}

Mailman::Application.run do
  default do
    Email.receive_mail(message)
  end
end

module Net
  class IMAP
    class ResponseParser
      def continue_req
        match(T_PLUS)
        #match(T_SPACE)   # Comment this line out to not expect a space.
        return ContinuationRequest.new(resp_text, @str)
      end
    end
  end
end

module Mailman
  module Receiver
    class IMAP
      def connect
        if @connection.nil? or @connection.disconnected?
          @connection = Net::IMAP.new(@server, @port, @ssl)
          @connection.authenticate("PLAIN", @username, @password) 
          #@connection.login(@username, @password)
        end
        @connection.select(@folder)
      end
    end
  end
end


class PlainAuthenticator
  def process(data)
    # Net::IMAP takes care of base64 encoding the result of this...
    return "#{@user}\0#{@user}\0#{@password}"
  end

  def initialize(user, password)
    @user = user
    @password = password
  end
end
Net::IMAP::add_authenticator('PLAIN', PlainAuthenticator)
