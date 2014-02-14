require 'sinatra'
require 'data_mapper'
require 'rack-flash'
require './lib/link'
require './lib/tag'
require './lib/user'
require './app/controllers/controllers_list.rb'
require_relative 'data_mapper_setup'
require_relative 'helpers/application.rb'

enable :sessions
set :session_secret, 'super secret'
use Rack::Flash
