require 'bundler/capistrano'

default_run_options[:pty] = false
ssh_options[:forward_agent] = true
set :use_sudo, false
set :user, "webghostingshell"


role :web, "m.xn--ycee.net"                          # Your HTTP server, Apache/etc
role :app, "m.xn--ycee.net"                          # This may be the same as your `Web` server
role :db,  "testapp.m.xn--ycee.net", :primary => true # This is where Rails migrations will run




set :application, "example.com"
set :repository,  "git@github.com:m4ry/books.git"
set :scm, :git
set :branch, 'master'
set :git_shallow_clone, 1
set :deploy_via, :remote_cache
set :copy_compression, :bz2
set :rails_env, 'production'
set :deploy_to, "/home/webghostingshell/#{application}"







# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end