class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        render json: convertToCustomFormat(@user)
    end

    private

    def convertToCustomFormat(user)
        customData = 
        {
          id: user.id,
          name: user.name,
          email: user.email,
          birthday: user.birthday,
          introduction: user.introduction
        }
        return customData
    end
end
