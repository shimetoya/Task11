class CreateSeats < ActiveRecord::Migration
  def change
    create_table :seats do |t|
      t.string :seat_type
      t.string :amount_seats
      t.timestamps null: false
    end
  end
end
