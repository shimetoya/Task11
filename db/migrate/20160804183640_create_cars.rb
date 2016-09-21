class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :car_type
      t.integer :amount_top_seats
      t.integer :amount_bottom_seats

      t.timestamps null: false
    end
  end
end
