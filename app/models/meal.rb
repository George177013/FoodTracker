class Meal < ApplicationRecord
  belongs_to :day

  before_validation :set_nil_nutrition_to_zero

  private

  def set_nil_nutrition_to_zero
    self.calories = 0 if calories.nil?
    self.protein  = 0 if protein.nil?
  end
end
