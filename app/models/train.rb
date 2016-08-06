class Train < ActiveRecord::Base
  validates :number, presence: true
  belongs_to :current_station, class_name: 'Station', foreign_key: :current_station_id
  belongs_to :current_route, class_name: 'Route', foreign_key: :route_id
  has_many :tickets
  has_many :cars
  #has_many :trains_routes
  #has_many :routes, through: :trains_routes
end