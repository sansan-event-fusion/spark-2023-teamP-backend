class RecruitmentsController < ApplicationController
  def index
    recruitments = Recruitment.all
    render json: { status: 'SUCCESS', message: 'Loaded recruitments', data: recruitments }
  end
end
