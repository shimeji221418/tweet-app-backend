class Api::V1::UsersController < Api::V1::ApplicationController
    before_action :set_user , only: [:show , :update ,:destroy]

    def index
        users = User.all.order(created_at: :asc)
        render status: 200 , json: {data: users}
    end

    def show
        render status: 200 , json: {data: @user}
    end

    def update
        if @user.update(user_params)
            render status: 200 , json: {data: @user}
        else
            render status: 400 , json: {data: @user.errors}
        end
    end

    def destroy
        if @user.destroy
            render status: 200 , json:{data: @user}
        else
            render status: 400 , json:{ data: @user.errors}
        end
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:name , :email)
    end
end
