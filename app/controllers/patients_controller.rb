class PatientsController < ApplicationController

  # GET: /patients
  get "/patients" do
    erb :"/patients/index.html"
  end

  # GET: /patients/new
  get "/patients/register" do
    @doctors = Doctor.all
    erb :"/patients/new.html"
  end

  # POST: /patients/register
  post "/patients/register" do
    if !Patient.find_by(email: params["email"])
      @doctors = Doctor.all
      user = Patient.new()
      params.each do |key, value|
        user.send("#{key}=",value)
      end

      if user.save && !user.doctor_id.nil?
        session["patient_id"] = user.id 
        redirect to "/patients/#{user.id}"
      else
        erb :"/patients/error.html"
      end
    else
      erb :"/patients/error.html"
    end
  end

  # GET: /patients/5
  get "/patients/:id" do
    if authenticated_patient?
      @user = Patient.find(params["id"])
      session["patient_id"] = @user.id
      erb :"/patients/show.html"
    else
      erb :"/patients/error.html"
    end
  end

  # GET: /patients/5/edit
  get "/patients/:id/edit" do
    if logged_in_patient?
      @user = Patient.find(params[:id])
      erb :"/patients/edit.html"
    else
      erb :"/patients/error.html"
    end
  end

  # PATCH: /patients/5
  patch "/patients/:id" do
    new_params = params.except!("_method") #except! removes the indicated key from hash
    user = Patient.find(params["id"])
    user.update(new_params)
    user
    redirect to "/patients/#{user.id}"
  end

  # DELETE: /patients/5/delete
  delete "/patients/:id/delete" do
    redirect "/patients"
  end
end
