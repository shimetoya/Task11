class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.integer :number
      t.string :car_type
      t.integer :amount_top_seats
      t.integer :amount_bottom_seats
      t.integer :amount_side_top_seats
      t.integer :amount_side_bottom_seats
      t.integer :amount_sitting_seats

      t.timestamps null: false
    end
  end
end
