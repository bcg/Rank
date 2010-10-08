class UsersController < ApplicationController
  
  def show
    @user = current_user
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Your account has been created, thank you for registering."
      redirect_to root_url
    else
      render :action => "new"
    end
  end
  
end
