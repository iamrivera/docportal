require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :index
  end

  helpers do 
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      user.find_by(session[:user_id])
    end
  end

end
