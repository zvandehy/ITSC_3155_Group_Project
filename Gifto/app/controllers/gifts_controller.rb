class GiftsController < ApplicationController
    def create
        @user = User.find(params[:user_id])
        @gift = @user.gifts.create(gift_params)
        redirect_to user_path(@user)
    end
    def edit
        # @user = User.find(params[:user_id])
        @gift = Gift.find(params[:id])
        @user = User.find(params[:user_id])
    end
    def update
        @gift = Gift.find(params[:id])
        @user = User.find(params[:user_id])
        if @gift.update(gift_params)
            # if @user.update()
            #     redirect_to @user
            # end
            redirect_to @user
        else 
            render 'edit'
        end
    end
    def promise
        @gift = Gift.find(params[:id])
        @user = User.find(params[:user_id])
        @gift.update_attribute(:giver_id, current_user.id)
        redirect_to user_path(@user)
    end
    def unpromise
        @gift = Gift.find(params[:id])
        @user = User.find(params[:user_id])
        @gift.update_attribute(:giver_id, nil)
        redirect_to user_path(@user)
    end
    private 
        def gift_params
            params.require(:gift).permit(:name, :description)
        end
end
