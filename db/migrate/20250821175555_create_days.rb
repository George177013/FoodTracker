class CreateDays < ActiveRecord::Migration[8.0]
  def change
    create_table :days do |t|
      t.date :date, null: false
      t.integer :calorie_goal, null: false, default: 0
      t.integer :protein_goal, null: false, default: 0

      t.timestamps
    end
  end
end
