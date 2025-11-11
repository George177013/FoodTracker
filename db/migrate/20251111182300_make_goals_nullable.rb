class MakeGoalsNullable < ActiveRecord::Migration[8.0]
  def change
    change_column :days, :calorie_goal, :integer, null: true
    change_column :days, :protein_goal, :integer, null: true
  end
end
