class DoctorsController < ApplicationController

  # GET: /doctors
  get "/doctors" do
    erb :"/doctors/index.html"
  end

  # GET: /doctors/new
  get "/doctors/new" do
    erb :"/doctors/new.html"
  end

  # POST: /doctors
  post "/doctors" do
    redirect "/doctors"
  end

  # GET: /doctors/5
  get "/doctors/:id" do
    erb :"/doctors/show.html"
  end

  # GET: /doctors/5/edit
  get "/doctors/:id/edit" do
    erb :"/doctors/edit.html"
  end

  # PATCH: /doctors/5
  patch "/doctors/:id" do
    redirect "/doctors/:id"
  end

  # DELETE: /doctors/5/delete
  delete "/doctors/:id/delete" do
    redirect "/doctors"
  end
end
