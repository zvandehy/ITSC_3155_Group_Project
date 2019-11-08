class GiftsController < ApplicationController
    def create
        print("Zero")
        @user = User.find(params[:user_id])
        @gift = @user.gifts.create(gift_params)
        redirect_to user_path(@user)
    end

    private 
        def gift_params
            print("ONe")
            params.require(:gift).permit(:name, :description)
        end
end
