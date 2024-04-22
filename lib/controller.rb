require 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
    Gossip.new(nil,params["gossip_author"],params["gossip_content"]).save
    redirect '/'
  end
  
  get '/gossips/:id' do
    @gossip = Gossip.find(params[:id])
    if @gossip 
      erb :show
    else
      "potin non trouvé"
    end
  end
end
