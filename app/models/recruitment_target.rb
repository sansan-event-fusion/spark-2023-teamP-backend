class RecruitmentTarget < ApplicationRecord
    belongs_to :recruitment

    validates :title, presence: true
end
