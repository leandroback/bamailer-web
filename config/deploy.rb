# -*- encoding : utf-8 -*-
require "bundler/capistrano"

server "166.78.31.214", :web, :app, :db, :primary => true

set :application, "bamailer"
set :user, "deployer"
set :deploy_to, "/var/www/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :rack_env, :production

set :scm, "git"
set :repository, "git@github.com:backing/#{application}.git"
set :branch, "master"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true
ssh_options[:port] = 24504

set :public_children, ["css","img","js"]

after "deploy", "deploy:cleanup" # keep only the last 5 releases
 
namespace :deploy do

  task :start do; end
  task :stop do; end
  task :restart, :roles => :app, :except => {:no_release => true} do
    run "touch #{deploy_to}/current/tmp/restart.txt"
  end

  task :setup_config, :roles => :app do
    sudo "ln -nfs #{current_path}/config/nginx.conf /usr/local/nginx/sites-enabled/#{application}"
    run "mkdir -p #{shared_path}/config"
    #put File.read("config/database.example.yml"), "#{shared_path}/config/database.yml"
    puts "Now edit the config files in #{shared_path}."
  end
  after "deploy:setup", "deploy:setup_config"

  #task :symlink_config, :roles => :app do
  #  run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  #end
  #after "deploy:finalize_update", "deploy:symlink_config"

end

