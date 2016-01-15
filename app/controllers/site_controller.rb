class SiteController < ApplicationController
  before_action :authorize, only: [:map]
  
  def index
  end

  def about
  end

  def map
    @rows = 6
    @columns = 12
  end

end
