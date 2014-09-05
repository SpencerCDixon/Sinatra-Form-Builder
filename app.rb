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
  @built = @form.build_form

  erb :show
end
