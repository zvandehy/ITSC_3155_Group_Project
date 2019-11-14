class UsersController < ApplicationController
    def new
    end
    def create
        @user = User.new(user_params)
        @user.save
        session[:user_id] = @user.id
        redirect_to @user
    end
    def show
        @user = User.find(params[:id])
    end
    def index
        @users = User.all
    end
    def edit
       @user = User.find(params[:id]) 
    end
    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to @user
        else
            render 'edit'
        end
    end
    def destroy
        @user = User.find(params[:id])
        if (current_user == @user)
            session[:user_id] = nil
            @user.destroy
            redirect_to action: 'new'
        else
            @user.destroy
            redirect_to root_path
        end
    end
end
private
    def user_params
        params.require(:user).permit(:name,:email,:password)
    end