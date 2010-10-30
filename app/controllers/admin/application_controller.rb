class Admin::ApplicationController < ApplicationController
  layout 'admin/application'
  before_filter :login_required
  before_filter :admin_required
  
  private
  
  def admin_required
    debugger
    return current_user.role?(Role::Admin)
  end
end