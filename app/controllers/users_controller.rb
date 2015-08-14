class UsersController < ApplicationController

  def new
	@user = User.new
  end

  def create
	@user = User.new(name: params[:user][:name], email: params[:user][:email])
	if @user.save
	  flash[:success] = "Welcome to the Event handler app!"
	  redirect_to root_url
	else
	  render :new
	end
  end

  def show
	@user = User.find(params[:id])
  end

end
