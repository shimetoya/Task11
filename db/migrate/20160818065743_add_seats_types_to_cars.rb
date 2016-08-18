class AddSeatsTypesToCars < ActiveRecord::Migration
  def up
    add_column :cars, :number, :integer
    add_column :cars, :type, :string
    add_column :cars, :amount_side_top_seats, :integer
    add_column :cars, :amount_side_bottom_seats, :integer
    add_column :cars, :amount_sitting_seats, :integer
    <<-SQL
      UPDATE Cars
       SET type = 'CoupeCar'
       WHERE car_type = 'купе'
    SQL
    <<-SQL
      UPDATE Cars
       SET type = 'EconomyCar'
       WHERE car_type = 'Плацкарт'
    SQL
    remove_column :cars, :car_type, :string
  end

  def down
    add_column :cars, :car_type, :string
    <<-SQL
      UPDATE Cars
       SET car_type = 'купе'
       WHERE type = 'CoupeCar'
    SQL
    <<-SQL
      UPDATE Cars
       SET car_type = 'Плацкарт'
       WHERE type = 'EconomyCar'
    SQL
    remove_column :cars, :number, :integer
    remove_column :cars, :type, :string
    remove_column :cars, :amount_side_top_seats, :integer
    remove_column :cars, :amount_side_bottom_seats, :integer
    remove_column :cars, :amount_sitting_seats, :integer
  end
end


