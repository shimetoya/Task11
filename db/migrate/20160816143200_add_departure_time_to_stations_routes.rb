class AddDepartureTimeToStationsRoutes < ActiveRecord::Migration
  def change
    add_column :stations_routes, :departure_time, :datetime
  end
end
