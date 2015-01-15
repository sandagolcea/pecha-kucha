require 'sinatra/base'

class PechaKucha < Sinatra::Base
  enable :sessions

  get '/' do
    session[:list] = []
    @list = session[:list]
    erb :index
  end

  post '/' do
    5.times do |i|
      user = "user#{i}".to_sym
      session[:list] << params[user] if ( params[user] && !params[user].empty? )    
    end

    @list = session[:list]
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
