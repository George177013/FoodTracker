class Day < ApplicationRecord
  has_many :meals, dependent: :destroy
  belongs_to :user
end
