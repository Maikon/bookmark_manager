require 'sinatra'
require 'data_mapper'
require 'rack-flash'
require 'sinatra/partial'
require_relative 'models/link'
require_relative 'models/tag'
require_relative 'models/user'
require_relative 'controllers/controllers_list.rb'
require_relative 'data_mapper_setup'
require_relative 'helpers/application.rb'

enable :sessions
set :session_secret, 'super secret'
use Rack::Flash
set :partial_template_engine, :erb
