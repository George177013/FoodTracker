class AddDefaultsToMeals < ActiveRecord::Migration[7.0]
  def change
    change_column_default :meals, :calories, 0
    change_column_default :meals, :protein, 0
  end
end
