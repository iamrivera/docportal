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
    if params.keys.first == "doctor"
      if existing_doctor #&& user.authenticate(user.password_digest)
        user = existing_doctor
        session["user_id"] = user.id
        redirect to "/doctors/#{user.id}"
      else
        redirect to "/doctors/new"
      end
    else
      if find_patient
      user = find_patient
      redirect to "/patients/#{user.id}"
      else
      redirect to "/patients/new"
      end
    end
    #if params keys doctor then find_doctor
    #doctor exists then take to doctor/id show page
    #if not exists then take to signup page
    #else find_patient
  end

  get '/logout' do 
    session.clear
    redirect to '/'
  end

  helpers do 
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      @user.find_by(session[:user_id])
    end

    def existing_doctor
      Doctor.find_by(email: params["doctor"]["email"], password_digest: params["doctor"]["password_digest"])
    end

    def find_patient
      Patient.find_by(email: params["patient"]["email"], password: params["patient"]["password"])
    end
  end

end
