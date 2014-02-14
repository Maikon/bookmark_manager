require 'sinatra'
require 'data_mapper'
require 'rack-flash'
require 'sinatra/partial'
require './app/models/link'
require './app/models/tag'
require './app/models/user'
require './app/controllers/controllers_list.rb'
require_relative 'data_mapper_setup'
require_relative 'helpers/application.rb'

enable :sessions
set :session_secret, 'super secret'
use Rack::Flash
set :partial_template_engine, :erb
