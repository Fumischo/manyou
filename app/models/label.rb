class Label < ApplicationRecord
  has_many :labelingsx, dependent: :destroy
  has_many :labels, through: :labelings
end
x