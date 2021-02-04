require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  configure do
    enable :sessions
    set :session_secret, "secret"  # BAD FORM TO MANUALLY SET - EXPERIEMENT WITH ruby -e "require 'securerandom'; puts SecureRandom.hex
  end

  get "/" do
    #session blank "user_id" on initial arrival
    @doctors = Doctor.all
    erb :index
  end

  post "/login" do
    # binding.pry
    # binding.pry | Do I use a case when?
    if params.keys.first == "doctor"
      user = Doctor.find_by("email" => params["doctor"]["email"])

      if user && user.authenticate(params["doctor"]["password"])
        session["doctor_id"] = user.id
        redirect to "/doctors/#{user.id}"
      else
        redirect to "/doctors/register"
      end
    else
      user = Patient.find_by("email" => params["patient"]["email"]) 
      
      if user && user.authenticate(params["patient"]["password"])
        session["patient_id"] = user.id
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

  helpers do 
    def logged_in_doctor?
      !!session[:doctor_id]
    end

    def logged_in_patient?
      !!session[:patient_id]
    end

    def current_patient
      Patient.find_by_id(session[:patient_id])
    end

    def current_doctor
      Doctor.find_by_id(session[:doctor_id])
    end
  end

end
