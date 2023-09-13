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
  

  def save_targets(targets)
    if targets.present?
      targets.each do |target|
        target = RecruitmentTarget.new(recruitment_id: self.id, title: target)
        unless target.save
          return target.errors
        end
      end
    end
    return nil
  end
end
