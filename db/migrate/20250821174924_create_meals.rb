class CreateMeals < ActiveRecord::Migration[8.0]
  def change
    create_table :meals do |t|
      t.string :name
      t.integer :calories, null: false, default: 0
      t.integer :protein, null: false, default: 0
      t.references :day, null: false, foreign_key: true

      t.timestamps
    end
  end
end
