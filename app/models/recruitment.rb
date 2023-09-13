class Recruitment < ApplicationRecord
  mount_uploader :image, RecruitmentImageUploader
  belongs_to :user
  has_many :recruitment_targets
  has_many :participants

  def self.search(keyword)
    where(
      "recruitments.title LIKE :keyword OR recruitments.description LIKE :keyword OR recruitments.area LIKE :keyword OR recruitment_targets.title LIKE :keyword",
      keyword: "%#{keyword}%"
    )
  end

  def save_targets(targets)
    return nil unless targets.present?

    targets.map do |target|
      recruitment_target = RecruitmentTarget.create(recruitment_id: self.id, title: target)
      recruitment_target.errors unless recruitment_target.persisted?
    end.compact
  end
end
