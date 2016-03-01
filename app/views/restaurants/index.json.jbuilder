json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :id, :name, :address, :phone, :hours, :food_type_id, :integer
  json.url restaurant_url(restaurant, format: :json)
end
