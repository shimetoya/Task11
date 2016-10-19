class AddIndexesToTickets < ActiveRecord::Migration
  def change
    add_index :tickets, :user_id
    add_index :tickets, :train_id
    add_index :tickets, :first_station_id
    add_index :tickets, :last_station_id
  end
end
