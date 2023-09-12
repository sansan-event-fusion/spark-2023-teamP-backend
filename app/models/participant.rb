class Participant < ApplicationRecor
  belongs_to :recruitment, counter_cache: true
end
