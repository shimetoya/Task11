class AddStationIdToTickets < ActiveRecord::Migration
  def change
    #add_column :tickets, :first_station, :integer
    add_belongs_to :tickets, :first_station
    add_belongs_to :tickets, :last_station
  end
end
