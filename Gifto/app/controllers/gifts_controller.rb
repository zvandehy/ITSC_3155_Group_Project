class GiftsController < ApplicationController
    def create
        @user = User.find(params[:user_id])
        @gift = @user.gifts.create(gift_params)
        redirect_to user_path(@user)
    end

    private 
        def gift_params
            params.require(:gift).permit(:name, :description)
        end
end
