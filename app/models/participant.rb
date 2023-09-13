class Participant < ApplicationRecord
  belongs_to :recruitment, counter_cache: true
end
