class AddSeatIdToCars < ActiveRecord::Migration
  def change
    add_belongs_to :seats, :car
  end
end
