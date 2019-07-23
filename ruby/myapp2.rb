require 'sinatra'
require 'sinatra/reloader'
 
get '/' do
    @title = 'Hello World!'
    @subtitle = 'Welcome to the world of sinatra and ruby.'
    erb :index
end