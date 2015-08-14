class SessionController < ApplicationController

  def new
  end

  def create
	@user = User.find_by(email: params[:session][:email])
	if @user
	  log_in @user
	  flash[:success] = "Welcome to Private Events!"
	  redirect_to root_url
	else
	  flash.now[:warning] = "That user does not exist."
	  render :new
	end
  end

  def destroy
  end

end
