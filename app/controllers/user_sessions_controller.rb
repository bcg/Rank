class UserSessionsController < ApplicationController
  def single_access_allowed?
    return false
  end
  
  def new
    if logged_in?
      flash[:notice] = "Welcome back!"
      redirect_to dashboard_url
    end
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Login successful!"
      redirect_back_or_default dashboard_url
    else
      render :action => :new
    end
  end
  
  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_back_or_default login_url
  end  
end
