class AddIndexesToCars < ActiveRecord::Migration
  def change
    add_index :cars, [:id, :type]
  end
end
