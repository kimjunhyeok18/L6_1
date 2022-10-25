class UsersController < ApplicationController
    def index
        @user = User.all
        @tweets = Tweet.all
    end
    def new
        @user = User.new
    end
    def create
        @user = User.new(        
            uid: params[:uid],
            password: params[:password],
            password_confirmation: params[:password_confirmation])
        if @user.save
            redirect_to root_path
        else
            render 'new'
        end
    end
    def delete
        @users = User.all
    end
    def destroy
        user = User.find(params[:id])
        user.destroy
        redirect_to root_path
    end
end
