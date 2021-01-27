require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :index
  end

  post "/" do
    # binding.pry
    if params.keys.first == "doctor"
      if find_doctor
        user = find_doctor
        redirect to "/doctors/#{user.id}"
      else
        redirect to "/doctors/new"
      end
    else
      if find_patient
        user = find_patient
        redirect to "/patients/#user.id}"
      else
        redirect to "patients/new"
      end
    end
    #if params keys doctor then find_doctor
    #doctor exists then take to doctor/id show page
    #if not exists then take to signup page
    #else find_patient
  end

  helpers do 
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      user.find_by(session[:user_id])
    end

    def find_doctor
      Doctor.find_by(email: params["doctor"]["email"], password: params["doctor"]["password"])
    end

    def find_patient
      Patient.find_by(email: params["patient"]["email"], password: params["patient"]["password"])
    end
  end

end
