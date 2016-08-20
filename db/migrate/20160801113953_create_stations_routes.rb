class CreateStationsRoutes < ActiveRecord::Migration
  def change
    create_table :stations_routes do |t|
      t.integer :route_id
      t.integer :station_id
    end
  end
end
