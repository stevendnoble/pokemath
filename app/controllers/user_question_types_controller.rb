require 'json'

class UserQuestionTypesController < ApplicationController

  def index
    #session variable sets the key :map_state to the data passed through from ajax call
    #'should' be working, theres a 200 response with the data as string in the logs
    if session[:userQuestionTypes]
      render json: { userQuestionTypes: session[:userQuestionTypes]}
    else
      render json: { userQuestionTypes: ['simpleAddition'] }
    end
  end
  
  def create
    session[:userQuestionTypes] = JSON.parse(params[:userQuestionTypes])
    render json: session[:userQuestionTypes]
  end
end
