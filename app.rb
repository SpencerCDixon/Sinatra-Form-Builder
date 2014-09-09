require 'sinatra'
require 'pry'
require './models/form_builder'

helpers do
  def h(text)
    Rack::Utils.escape_html(text)
  end
end

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
