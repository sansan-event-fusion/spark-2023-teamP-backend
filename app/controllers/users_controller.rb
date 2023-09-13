class UsersController < ApplicationController
    def show
        user = User.find(params[:id])
        render json: convertToCustomFormat(user)
    end

    private

    def convertToCustomFormat(user)
        customData =
        {
          id: user.id,
          name: user.name,
          birthday: user.birthday,
          introduction: user.introduction,
          profile_imageUrl: user.profile_image.file.file
        }
        return customData
    end
end
