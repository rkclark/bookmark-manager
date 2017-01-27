ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative 'dmconfig'
require_relative 'server.rb'
require_relative 'controllers/links'
require_relative 'controllers/users'
require_relative 'controllers/sessions'
require_relative 'controllers/tags'

BookmarkManager.run! if $0 == 'app/app.rb'
