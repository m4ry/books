require "bundler/capistrano"

default_run_options[:pty] = true

# be sure to change these
set :user, 'webghostingshell'
set :domain, 'm.xn--ycee.net'
set :application, 'testapp'
set :ssh_options, {:forward_agent => true}


# the rest should be good
set :repository, "git@github.com:m4ry/books.git"
set :deploy_to, "/home/#{user}/#{domain}"
set :deploy_via, :remote_cache
set :scm, 'git'
set :branch, 'master'
set :git_shallow_clone, 1
set :scm_verbose, true
set :use_sudo, false

server domain, :app, :web
role :db, domain, :primary => true

namespace :deploy do
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
end