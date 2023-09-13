class RecruitmentsController < ApplicationController
  before_action :set_recruitment, only: [:show, :apply]
  def index
    recruitments = Recruitment.all
    render json: convert_to_custom_format(recruitments)
  end

  def show
    render json: convert_to_custom_format_show(@recruitment)
  end

  def create
    recruitment = Recruitment.new(recruitment_params)
    if recruitment.save
      err = recruitment.save_targets(params[:targets])
      if err
        render json: { status: 'ERROR', data: err }
      end
      render json: { status: 'SUCCESS' }
    else
      render json: { status: 'ERROR', data: recruitment.errors }
    end
  end

  def apply
    participant = @recruitment.participants.new(params[:userId])
    if participant.save
      render json: { status: 'SUCCESS' }
    else
      render json: { status: 'ERROR', data: participant.errors }
    end
  end
  private

  def set_recruitment
    @recruitment = Recruitment.find(params[:id])
  end

  def recruitment_params
    params.deep_transform_keys!(&:underscore)
    params.permit(:user_id, :title, :description, :area, :people_limit, :image)

  end

  def convert_to_custom_format(recruitments)
    custom_data = recruitments.map do |recruitment|
      {
        organizer: {
          id: recruitment.user_id,
          name: recruitment.user.name,
          profileImageUrl: recruitment.user.profile_image.url
        },
        id: recruitment.id,
        title: recruitment.title,
        peopleLimit: recruitment.people_limit,
        participantsCount: recruitment.participants_count,
        imageUrl: recruitment.image.url,
        createdAt: recruitment.created_at,
        updatedAt: recruitment.updated_at
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
        imageUrl: recruitment.user.profile_image.url
      },
      recruitment: {
        area: recruitment.area,
        title: recruitment.title,
        targets: recruitment.recruitment_targets.map {|target| target.title},
        description: recruitment.description,
        peopleLimit: recruitment.people_limit,
        participantsCount: recruitment.participants_count,
        imageUrl: recruitment.image.url,
        createdAt: recruitment.created_at,
        updatedAt: recruitment.updated_at
      },
    }
    return custom_data
  end

end
