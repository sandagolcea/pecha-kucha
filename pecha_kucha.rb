require 'sinatra/base'

class PechaKucha < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/' do
    session[:user1] = params[:user1]
    @user2 = params[:user2]
    @user3 = params[:user3]
    @user4 = params[:user4]
    @user5 = params[:user5]

    erb :index
  end

  post '/start' do
    @user1 = session[:user1]
    erb :start
  end

  get '/stop' do
    erb :stop
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
