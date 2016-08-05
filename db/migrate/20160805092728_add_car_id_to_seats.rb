class AddCarIdToSeats < ActiveRecord::Migration
  def change
    add_belongs_to :cars, :seat
  end
end
