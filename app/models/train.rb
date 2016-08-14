class Train < ActiveRecord::Base
  validates :number, presence: true
  belongs_to :current_station, class_name: 'Station', foreign_key: :current_station_id
  belongs_to :current_route, class_name: 'Route', foreign_key: :route_id
  has_many :tickets
  has_many :cars
  #has_many :trains_routes
  #has_many :routes, through: :trains_routes

  def count_of_seats(car_type, seats_type)
    return self.cars.where('type = ? ', car_type).sum(seats_type)
  end
end
