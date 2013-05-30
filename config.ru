# encoding: utf-8

require './init'

run Rack::URLMap.new(
  '/'       => MyApp::PublicApp.new,
  '/admin'  => MyApp::AdminApp.new,
  '/user'   => MyApp::UserApp.new
)