class Station < ActiveRecord::Base
  validates :title, presence: true
  has_many :trains, foreign_key: :current_station_id
  has_many :stations_routes
  has_many :routes, through: :stations_routes
  scope :ordered, -> { select('stations.*, stations_routes.station_number').joins(:stations_routes).order("stations_routes.station_number").uniq }

  def update_station_number(route, station_number)
    station_route = station_route(route)
    station_route.update(station_number: station_number) if station_route
  end

  def station_number_in(route)
    station_route(route).try(:station_number)
  end

  def arrival_time_in(route)
    station_route(route).try(:arrival_time)
  end

  def departure_time_in(route)
    station_route(route).try(:departure_time)
  end

  protected

  def station_route(route)
    @station_route ||= stations_routes.where(route: route).first
  end
end
