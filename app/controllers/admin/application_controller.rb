class Admin::ApplicationController < ApplicationController
  layout 'admin/application'
  before_filter :login_required
end