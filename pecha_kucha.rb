require 'sinatra/base'

class PechaKucha < Sinatra::Base
  enable :sessions

  get '/' do
    session[:list] = []
    @list = session[:list]
    erb :index
  end

  post '/' do
    list = []
  
    if ( params[:user] && !params[:user].empty? ) 
      
      list = params[:user].split(",") 
      
      if (list.length > 0) 
        list.each do |user|
          user.strip!
          session[:list] << user if (user.length > 0)
        end
      end

    end  

    session[:list].uniq!
    @list = session[:list]
    erb :index

  end

  post '/start' do
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
