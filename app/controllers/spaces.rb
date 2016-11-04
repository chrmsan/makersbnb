require 'json'

class Makersbnb < Sinatra::Base

  get '/' do
    redirect '/spaces'
  end

  get '/spaces' do
    @spaces = Space.all
    erb :'spaces/index'
  end

  post '/spaces' do
    space  = Space.new(name: params[:name],
                      price: params[:price],
                      description: params[:description],
                      available_from: params[:available_from],
                      available_to: params[:available_to])
    location = Location.first_or_create(name: (params[:location]).intern)
    space.location = location
    space.user = current_user
    space.save
    redirect '/spaces'
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

end
