class Recruitment < ApplicationRecord
  mount_uploader :image, RecruitmentImageUploader
  belongs_to :user
end
