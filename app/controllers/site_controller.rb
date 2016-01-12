class SiteController < ApplicationController
  
  # this secures the site controller, so users need to login before they see these actions
  # before_filter :authorize
  
  def index
    #session variable sets the key :map_state to the data passed through from ajax call
    #'should' be working, theres a 200 response with the data as string in the logs
    session[:map_state] = params[:data_value]
    @rows = 6
    @columns = 12
  end

end
