class LikesController < ApplicationController
    def create
        @like = Like.new(user_id: current_user.id, tweet_id: params[:tweet_id])
        @like.save
        redirect_to root_path
    end
    def destroy
        @like = Like.find_by(tweet_id: params[:id],user_id: current_user.id)
        @like.destroy
        redirect_to root_path
    end
end
