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

  # POST: /patients
  post "/patients/register" do
    binding.pry
    @doctors = Doctor.all
    user = Patient.new()
    params.each do |key, value|
      user.send("#{key}=",value)
    end

    if user.save
      redirect to "/patients/#{user.id}"
    else
      erb :"/patients/error.html"
    end
  end

  # GET: /patients/5
  get "/patients/:id" do
    @user = Patient.find(params[:id])
    session["user_id"] = @user.id
    erb :"/patients/show.html"
  end

  # GET: /patients/5/edit
  get "/patients/:id/edit" do
    erb :"/patients/edit.html"
  end

  # PATCH: /patients/5
  patch "/patients/:id" do
    redirect "/patients/:id"
  end

  # DELETE: /patients/5/delete
  delete "/patients/:id/delete" do
    redirect "/patients"
  end
end
