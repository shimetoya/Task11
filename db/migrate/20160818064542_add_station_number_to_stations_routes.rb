class AddStationNumberToStationsRoutes < ActiveRecord::Migration
  def change
    add_column :stations_routes, :station_number, :integer
  end
end
