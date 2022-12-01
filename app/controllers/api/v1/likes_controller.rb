class Api::V1::LikesController < Api::V1::ApplicationController
    skip_before_action :authenticate_user

    def create
        user = User.find(params[:user_id])
        like = user.likes.create(like_params)
        if like
            render status: 200 , json: like
        else
            render status: 400 , json: like.errors
        end
    end

    def destroy
        @like = Like.find(params[:id])
        if @like.destroy
            render status: 200 , json: @like
        else
            render status: 400 , json: @like.errors
        end
    end

    def likes_by
        like = Like.find_by(user_id: params[:user_id] , post_id: params[:post_id])
        render json: {data: like}
    end

    def likes_count
        count = Like.where(post_id: params[:post_id]).count
        render json: count
    end

    private

    def like_params
        params.require(:like).permit(:post_id, :user_id)
    end
end
