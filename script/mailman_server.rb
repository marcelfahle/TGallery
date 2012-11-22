#!/usr/bin/env ruby
require 'rubygems'
require 'bundler/setup'
require 'mailman'


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
