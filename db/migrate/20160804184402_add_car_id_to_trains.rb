class AddCarIdToTrains < ActiveRecord::Migration
  def change
    add_belongs_to :cars, :train
  end
end
