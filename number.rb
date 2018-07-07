require 'sinatra'
require 'sinatra/reloader'

get '/' do
    erb :index, :locals => {}
end