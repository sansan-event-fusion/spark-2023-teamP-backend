class Recruitment < ApplicationRecord
  mount_uploader :image, RecruitmentImageUploader

  has_many :participants

  def save_targets(targets)
    targets.each do |target|
      target = RecruitmentTarget.new(recruitment_id: self.id, title: target)
      unless target.save
        return target.errors
      end
    end
    return nil
  end
end
