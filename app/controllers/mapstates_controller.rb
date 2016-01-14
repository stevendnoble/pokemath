require 'json'

class MapstatesController < ApplicationController

  def index
    #session variable sets the key :map_state to the data passed through from ajax call
    #'should' be working, theres a 200 response with the data as string in the logs
    render json: { map_state: session[:map_state]}
  end
  
  def create
    session[:map_state] = JSON.parse(params[:data_value])
    render json: session[:map_state]
  end
end
