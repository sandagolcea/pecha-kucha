require 'sinatra/base'

class PechaKucha < Sinatra::Base
  enable :sessions

  get '/' do
    session[:list] = []
    erb :index
  end

  post '/' do
    
    session[:list] << params[:user1] if ( params[:user1] && !params[:user1].empty? )
    session[:list] << params[:user2] if ( params[:user2] && !params[:user2].empty? )
    session[:list] << params[:user3] if ( params[:user3] && !params[:user3].empty? )
    session[:list] << params[:user4] if ( params[:user4] && !params[:user4].empty? )
    session[:list] << params[:user5] if ( params[:user5] && !params[:user5].empty? )

    puts session.inspect
    erb :index
  end

  post '/start' do
    # @user = session[:user]
    session[:list].shuffle!
    @user = session[:list].pop
    erb :start
  end

  get '/stop' do
    erb :stop
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
