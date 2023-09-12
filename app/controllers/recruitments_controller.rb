class RecruitmentsController < ApplicationController
  def index
    @recruitments = Recruitment.all
    render json: convert_to_custom_format(@recruitments)
  end

  def show
    @recruitment = Recruitment.find(params[:id])
    render json: convert_to_custom_format_show(@recruitment)
  end

  private

  def convert_to_custom_format(recruitments)
    custom_data = recruitments.map do |recruitment|
      {
        id: recruitment.id,
        image: recruitment.image,
        title: recruitment.title,
        organizer: {
          name: recruitment.user.name,
          profileImage: recruitment.user.profile_image
        },
        created_at: recruitment.created_at,
        peopleLimit: recruitment.people_limit,
        participantsCount: recruitment.participants_count
      }
    end
    return custom_data
  end

  def convert_to_custom_format_show(recruitment)
    custom_data = 
    {
      organizer: {
        id: recruitment.user_id,
        name: recruitment.user.name,
        image: recruitment.user.profile_image
      },
      recruitment: {
        area: recruitment.area,
        title: recruitment.title,
        targets: [
          {
            title: recruitment.title
          }
        ],
        description: recruitment.description,
        peopleLimit: recruitment.people_limit,
        participantsCount: recruitment.participants_count
      }
    }
    return custom_data
  end
  
end