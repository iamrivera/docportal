class DoctorsController < ApplicationController

  # GET: /doctors
  get "/doctors" do
    erb :"/doctors/index.html"
  end

  # GET: /doctors/register
  get "/doctors/register" do
    #session "user_id" blank on initial arrival
    erb :"/doctors/new.html"
  end

  # POST: /doctors/register
  post "/doctors/register" do
    if !Doctor.find_by(email: params["email"]) 
      user = Doctor.new()
      params.each do |key, value|
        user.send("#{key}=",value)
      end
  
      if user.save
        session["doctor_id"] = user.id #recreate for patient controller
        redirect to "/doctors/#{user.id}"
      else
        erb :"/doctors/error.html"
      end
    else
      erb :"/doctors/error.html"
    end
  end

  # GET: /doctors/5
  get "/doctors/:id" do
    # binding.pry #think about all routes you want logged in (if else OR Not logged in containing condional logic)
    # binding.pry
    if authenticated_doctor?
      @user = Doctor.find(params[:id])
      @patients = @user.patients
      erb :"/doctors/show.html"
    else
      erb :"/doctors/error.html" #update error pages accordingly
    end
  end

  # GET: /doctors/5/edit
  get "/doctors/:id/edit" do
    # binding.pry
    if authenticated_doctor? #try using the negative method with built in redirect
      @user = Doctor.find(params[:id]) 
      erb :"/doctors/edit.html"
    else
      erb :"/doctors/error.html" #update error pages accordingly
    end
  end

  # PATCH: /doctors/5
  patch "/doctors/:id" do
    new_params = params.except!("_method") #except! removes the indicated key from hash
    user = Doctor.find(params["id"])
    user.update(new_params)
    user
    redirect "/doctors/#{user.id}"
  end

    #GET: /doctors/patient/:id
    get "/doctors/patient/:id" do #PROTECT EDITS, GETS, PATCH, DELETE - Doctor id == Session id / Also needs to protect the patient from other doctor's editing
      # binding.pry
      if authenticated_doctor_patient?
        @patient = Patient.find(params[:id])
        erb :"/doctors/patprofile.html"
      else
        erb :"/doctors/error.html"
      end
    end

    #PATCH: /doctors/patient/:id
    patch "/doctors/patient/:id" do
      new_params = params.except!("_method")
      @patient = Patient.find(params["id"])
      @patient.update(new_params)
      @patient
      redirect "/doctors/#{current_doctor.id}"
    end

  #GET: /doctors/error
  get "/doctors/error" do 
    erb :"/doctors/error.html"
  end

  # GET: /doctors/patient/:id/delete 
  get "/doctors/patient/:id/delete" do
    if authenticated_doctor_patient?
      @patient = Patient.find(params[:id])
      @patient.delete #COULD CHANGE THIS TO DESTROY TO REMOVE FROM DB, BUT PATIENT RECORDS SHOULD BE KEPT 
      redirect to "/doctors/#{session[:doctor_id]}"
    else
      erb :"doctors/error.html"
    end
  end


  # DELETE: /doctors/5/delete
  delete "/doctors/:id/delete" do
    redirect "/doctors"
  end
end
