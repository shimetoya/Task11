class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :fio

      t.timestamps null: false
    end
  end
end
