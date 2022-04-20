class Rubigon < ApplicationRecord
  has_many :acts, dependent: :destroy
  has_one_attached :image

  validates :stage_no, presence: true
  validates :enemy, presence: true
end
