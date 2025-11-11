class Day < ApplicationRecord
  has_many :meals, dependent: :destroy
  belongs_to :user

  before_validation :set_nil_goals_to_zero

  private

  def set_nil_goals_to_zero
    self.calorie_goal = 0 if calorie_goal.nil?
    self.protein_goal = 0 if protein_goal.nil?
  end
end
