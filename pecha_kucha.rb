require 'sinatra/base'

class PechaKucha < Sinatra::Base
  enable :sessions

  get '/' do
    session[:list] = []
    erb :index
  end

  post '/' do

    # puts session.inspect
    @user1 = params[:user1]
    @user2 = params[:user2]
    @user3 = params[:user3]
    @user4 = params[:user4]
    @user5 = params[:user5]    
    

    @list = []
    @list << params[:user1] if ( params[:user1] && !params[:user1].empty? )
    
    session[:list] << @list if !@list.empty?
    puts session.inspect
    erb :index
  end

  post '/start' do
    # @user = session[:user]
    session[:list].shuffle
    @user = session[:list].pop
    erb :start
  end

  get '/stop' do
    erb :stop
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
