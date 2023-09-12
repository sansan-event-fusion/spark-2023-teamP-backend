class Recruitment < ApplicationRecord
  mount_uploader :image, RecruitmentImageUploader
  belongs_to :user
  has_many :recruitment_targets
end
