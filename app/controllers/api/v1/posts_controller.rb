class Api::V1::PostsController < Api::V1::ApplicationController
    before_action :set_post , only: [:show, :update ,:destroy]
    skip_before_action :authenticate_user
        def index
            posts = Post.all.order(created_at: :asc)
            render status: 200 , json: {data: posts}
        end

        def show
            render status: 200 , json: {data: @post}
        end

        def create
            user = User.find(params[:user_id])
            post = user.post.build(post_params)
            if post
                render status: 200 , json: {data: post}
            else
                render status: 400 , json: {data: post.errors}
            end
        end

        def update
            if @post.update(post_params)
                render status: 200 , json: {data: @post}
            else
                render status: 400 , json: {data: @post.errors}
            end
        end

        def destroy
            if @post.destroy
                render status: 200 , json:{data: @post}
            else
                render status: 400 , json:{ data: @post.errors}
            end
        end

        private

        def set_post
            @post = Post.find(params[:id])
        end

        def post_params
            params.require(:post).permit(:title ,:boby, :user_id)
        end
end
