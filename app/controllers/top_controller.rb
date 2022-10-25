class TopController < ApplicationController
    def main
        current_user ||= nil
        if current_user
            render "main"
        else
            render "login"
        end
    end
    def login
        @user = User.find_by(uid: params[:uid])
        @user_all = User.all
        if @user
            if BCrypt::Password.new(@user.pass) == params[:password]
                session[:login_uid] = params[:uid]
                redirect_to root_path
            end
        else
            render "error"
        end
    end
    def logout
        session.delete(:login_uid)
        redirect_to root_path
    end
end
