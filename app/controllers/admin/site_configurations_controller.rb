class Admin::SiteConfigurationsController < Admin::ApplicationController
  def show
    @buckets = Bucket.find(:all, :order => "name ASC")
  end
  
  def update
    @buckets = Bucket.find(:all, :order => "name ASC")
    if @site_configuration.update_attributes(params[:site_configuration])
      flash[:notice] = "Your settings have been saved."
      redirect_to admin_site_configuration_url
    else
      render :action => :show
    end
  end
end
