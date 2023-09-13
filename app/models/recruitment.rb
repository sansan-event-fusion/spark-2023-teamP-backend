class Recruitment < ApplicationRecord
  mount_uploader :image, RecruitmentImageUploader
  belongs_to :user
  has_many :recruitment_targets
  has_many :participants

  validates :title, length: {minimum: 1, maximum: 30}
  validates :description, length: {minimum: 1, maximum: 140}
  validates :area, presence: true
  validates :people_limit, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :image, presence: true

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
