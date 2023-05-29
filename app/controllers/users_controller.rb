class UsersController < ApplicationController
    before_action :authorize, only: :show
    def create 
        user = User.create!(user_params)
        session[:user_id] = user.id
        render json: user, status: :created
    end

    # use a instance variable will alow for the find to be done inside of the application controller and shared here
    def show
        render json: @current_user
    end

    private

    def user_params 
        params.permit(:username, :password_confirmation,  :password, :image_url, :bio)
    end

end
