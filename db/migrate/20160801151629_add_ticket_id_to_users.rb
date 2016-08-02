class AddTicketIdToUsers < ActiveRecord::Migration
  def change
    add_belongs_to :tickets, :user
  end
end
