require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  configure do
    enable :sessions
    set :session_secret, "secret"
  end

  get "/" do
    #session blank "user_id" on initial arrival
    erb :index
  end

  post "/login" do
    # binding.pry
    # binding.pry | Do I use a case when?
    if params.keys.first == "doctor"
      user = Doctor.find_by("email" => params["doctor"]["email"])

      if user && user.authenticate(params["doctor"]["password"])
        session["user_id"] = user.id
        redirect to "/doctors/#{user.id}"
      else
        redirect to "/doctors/register"
      end
    else
      user = Patient.find_by("email" => params["patient"]["email"]) 
      
      if user && user.authenticate(params["patient"]["password"])
        session["user_id"] = user.id
        redirect to "/patients/#{user.id}"
      else
        redirect to "/patients/register"
      end
    end
  end

  get '/logout' do 
    session.clear
    erb :logout
  end

end
