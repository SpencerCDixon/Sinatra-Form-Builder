require 'sinatra'
require 'pry'
require './models/form_builder'

get '/' do
  redirect '/create'
end

get '/create' do
  erb :home
end

post '/create' do
  @form = FormBuilder.new(params)

  erb :show
end
