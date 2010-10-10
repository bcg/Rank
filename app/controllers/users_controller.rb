class UsersController < ApplicationController
  
  def show
    @user = current_user
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])

    unless @site_configuration.signup_password.blank?
      if @site_configuration.signup_password != params[:registration_code]
        @user.errors.add(:base, "Signup registration code is not correct.")
        render :action => "new"
        return
      end
    end
    
    if @user.save
      flash[:notice] = "Your account has been created, thank you for registering."
      redirect_to dashboard_url
    else
      render :action => "new"
    end
  end
  
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Your account settings have been updated."
      redirect_to user_url(:current)
    else
      render :action => :show
    end
  end
  
end
