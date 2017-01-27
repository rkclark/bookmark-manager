ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require 'mailgun-ruby'

require 'dotenv'
Dotenv.load

require_relative 'dmconfig'
require_relative 'server.rb'
require_relative 'controllers/links'
require_relative 'controllers/users'
require_relative 'controllers/sessions'
require_relative 'controllers/tags'
require_relative 'services/send_recover_link.rb'

BookmarkManager.run! if $0 == 'app/app.rb'
