class AddStationNumberToStationsRoutes < ActiveRecord::Migration
  def change
    add_column :station_routes, :station_number, :integer
  end
end
