class SessionsController < ApplicationController
  def new
  end

  def create

  	username = params[:username];

  	user = User.find_by(username: "samuelshp")

  	if user && user.authenticate(params[:password])
  		render 'new'
  	else
  		redirect_to root_url
  		
  	end

  	# user = params[:session][:email]

  end
end
