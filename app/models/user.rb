# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  mount_uploader :profile_image, ProfileImageUploader
  has_many :recruitments

  validates :name, length: {minimum: 1, maximum: 20}
  validates :birthday, presence: true
  validates :introduction, length: {maximum: 140}
  validates :profile_image, presence: true
  validate :date_before_start

  def date_before_start
    return if birthday.blank?
    errors.add(:birthday, "は今日以前のものを選択してください") if birthday > Date.today
  end

end
