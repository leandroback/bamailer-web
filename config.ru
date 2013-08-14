# encoding: utf-8

require './init'

run Rack::URLMap.new(
  '/'       => Bamailer::PublicApp.new,
  '/admin'  => Bamailer::AdminApp.new,
  '/user'   => Bamailer::UserApp.new
)