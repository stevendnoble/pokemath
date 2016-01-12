class SiteController < ApplicationController
  
  # this secures the site controller, so users need to login before they see these actions
  # before_filter :authorize
  
  def index
  end

  def about
  end

  def map
    @rows = 6
    @columns = 12
  end
end
