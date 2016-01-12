class SiteController < ApplicationController
  
  # this secures the site controller, so users need to login before they see these actions
  # before_filter :authorize
  
  def index
    session[:map_state] = params[:data_value]
    @rows = 6
    @columns = 12
  end

end
