class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :hours
      t.string :food_type_id
      t.string :integer

      t.timestamps null: false
    end
  end
end
