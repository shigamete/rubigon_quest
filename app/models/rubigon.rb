class Rubigon < ApplicationRecord
  has_many :acts, dependent: :destroy
  has_one_attached :image
end
