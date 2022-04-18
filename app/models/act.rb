class Act < ApplicationRecord
  MAX_ACTS_COUNT = 2
  belongs_to :rubigon
  validate :acts_count_must_be_within_limit, on: :create

  private
    def acts_count_must_be_within_limit
      errors.add(:rubigon, "acts count limit: #{MAX_ACTS_COUNT}") if rubigon.acts.count >= MAX_ACTS_COUNT
    end
end
