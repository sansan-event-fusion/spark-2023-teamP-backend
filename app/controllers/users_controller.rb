class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        render json: convert_to_custom_format(@user)
    end

    private

    def convert_to_custom_format(user)
        custom_data = 
        {
          id: user.id,
          name: user.name,
          email: user.email,
          birthday: user.birthday,
          introduction: user.introduction
        }
        return custom_data
    end
end
