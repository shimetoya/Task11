class CreateTrainsRoutes < ActiveRecord::Migration
  def change
    create_table :trains_routes do |t|
      t.integer :train_id
      t.integer :route_id
    end
  end
end
