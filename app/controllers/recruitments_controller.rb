class RecruitmentsController < ApplicationController
  def index
    recruitments = Recruitment.all
    render json: { status: 'SUCCESS', message: 'Loaded recruitments', data: recruitments }
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
    participant = @recruitment.participants.new(params[:user_id])
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
    params.permit(:user_id, :title, :description, :area, :people_limit, :image)
  end
end
