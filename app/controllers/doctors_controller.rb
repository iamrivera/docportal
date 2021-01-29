class DoctorsController < ApplicationController

  # GET: /doctors
  get "/doctors" do
    erb :"/doctors/index.html"
  end

  # GET: /doctors/new
  get "/doctors/register" do
    #session "user_id" blank on initial arrival
    erb :"/doctors/new.html"
  end

  # POST: /doctors
  post "/doctors/register" do
    # binding.pry
    user = Doctor.new()
    params.each do |key, value|
      user.send("#{key}=",value)
    end

    if user.save
      redirect to "/doctors/#{user.id}"
    else
      erb :"/doctors/error.html"
    end
  end

  # GET: /doctors/5
  get "/doctors/:id" do
    @user = Doctor.find(params[:id])
    session["user_id"] = @user.id
    @patients = Patient.all
    # binding.pry
    erb :"/doctors/show.html"
  end

  # GET: /doctors/5/edit
  get "/doctors/:id/edit" do
    @user = Doctor.find(params[:id]) 
    erb :"/doctors/edit.html"
  end

  # PATCH: /doctors/5
  patch "/doctors/:id" do
    new_params = params.except!("_method") #except! removes the indicated key from hash
    user = Doctor.find(params["id"])
    user.update(new_params)
    user
    redirect "/doctors/#{user.id}"
  end

  #GET: /doctors/error
  get "/doctors/error" do 
    erb :"/doctors/error.html"
  end

  # DELETE: /doctors/5/delete
  delete "/doctors/:id/delete" do
    redirect "/doctors"
  end
end
