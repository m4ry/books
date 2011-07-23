# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
run Mysqltestapp::Application

ENV['GEM_HOME']="#{ENV['HOME']}/.rvm"
ENV['GEM_PATH']="#{ENV['GEM_HOME']}:/gems/ruby-1.9.2-p290/gems"
require 'rubygems'
Gem.clear_paths

