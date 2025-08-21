json.extract! meal, :id, :name, :calories, :protein, :created_at, :updated_at
json.url meal_url(meal, format: :json)
