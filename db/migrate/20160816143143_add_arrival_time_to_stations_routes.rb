class AddArrivalTimeToStationsRoutes < ActiveRecord::Migration
  def change
    add_column :stations_routes, :arrival_time, :datetime
  end
end
