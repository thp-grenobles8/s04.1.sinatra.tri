require 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end

  # post '/get_index' do
  # id = params["id"]
  # puts id
  # redirect '/'
  # end

  get '/gossips/:id/' do
    id = params["id"].to_i
    erb :show, locals: {gossip: Gossip.find(id), id: id}
  end

  get '/gossips/:id/edit' do
    id = params["id"].to_i
    erb :edit, locals: {id: id}
  end

  post '/gossips/:id/edit' do
    id = params["id"].to_i
    txt_to_edit = params["modif"]
    puts txt_to_edit
    Gossip.edit(id,txt_to_edit)
    redirect '/'

  end





end