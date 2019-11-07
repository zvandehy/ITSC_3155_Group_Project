class SessionController < ApplicationController
    def login
        @user = @users.find(params[:email])
        if (params[:password] == @user.password)
            session[:user_id] = @user.id
        end
        redirect_to @user
    end
    
    def logout
        session[:user_id] = nil
        redirect_to 'users/new'
    end
end
