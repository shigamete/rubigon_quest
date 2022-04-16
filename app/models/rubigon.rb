class Rubigon < ApplicationRecord
  has_many :acts, dependent: :destroy
end
