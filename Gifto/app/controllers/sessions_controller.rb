class SessionsController < ApplicationController
  def new
  end
  
  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.password == params[:password]
      session[:user_id] = @user.id
      redirect_to @user, notice: "Logged in!"
    else
      flash.now[:alert] = "Email or password is invalid"
      render "new"
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
  
  
  before_action :redirect_home, :only=>[:new]
  private
    def redirect_home
      if current_user
        redirect_to current_user
      end
    end
end
