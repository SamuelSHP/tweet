class SessionsController < ApplicationController
  def new
  end

  def create

  	# username = params[:username];

  	user = User.find_by(email: params[:session][:email])

  	if user && user.authenticate(params[:session][:password])
  		log_in user
      redirect_to user
  	else
      flash.now[:danger] = 'Invalid email/password combination'
  		render 'new'  		
  	end

  	# user = params[:session][:email]

  end

  def destroy
    log_out
    redirect_to root_url
  end
end
