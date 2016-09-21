class AddPassportInformationToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :passport_information, :string
  end
end
