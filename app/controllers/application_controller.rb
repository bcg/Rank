class ApplicationController < ActionController::Base
  helper_method :current_user_session, :current_user, :logged_in?
  before_filter :load_account
  before_filter :load_site_configuration

  protect_from_forgery 
  
  private
  
  def load_account
    @current_account = Account.find_by_cname(request.host)
    if @current_account.nil?
      @current_account = Account.find_by_cname("www.#{request.host}")
    end
  end
  
  def load_site_configuration
    @site_configuration = @current_account.site_configuration
    if @site_configuration.nil?
      @site_configuration = SiteConfiguration.new
      @site_configuration.display_name = "Unconfigured System"
      flash[:error] = "You have not set the system configuration yet."
      redirect_to root_url
    end
  end

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
  
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
  
  def logged_in?
    current_user != nil
  end

  def login_required
    unless current_user
      store_location
      flash[:notice] = "You must be logged in to access this page"
      redirect_to login_url
      return false
    end
  end
  
  def no_login_required
    if current_user
      store_location
      flash[:notice] = "You must be logged out to access this page"
      redirect_to root_url
      return false
    end    
  end

  def store_location
    session[:return_to] = request.request_uri
  end
  
  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end
  
end