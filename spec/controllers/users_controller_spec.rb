require 'rails_helper'
require 'ffaker'

RSpec.describe UsersController, type: :controller do


    before do
      user_params = Hash.new
      user_params[:username] = FFaker::Name.name
      user_params[:password] = FFaker::Lorem.words(2).join
      user_params[:password_confirmation] = user_params[:password]
      @current_user = User.create(user_params)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@current_user)
    end



    describe "GET #new" do
      it "should assign @user" do
        get :new
        expect(assigns(@current_user)).to be_instance_of(:user)
      end

      it "should render the :new view" do
        get :new
        expect(response).to redirect_to(user_path(@current_user))
      end
    end
end

    





