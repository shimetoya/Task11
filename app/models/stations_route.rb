class StationsRoute < ActiveRecord::Base
  belongs_to :station
  belongs_to :route

  default_scope {order(:station_number)}
  validates :station_number, uniqueness: {scope: :route_id}
  before_validation :set_station_number
  before_save :set_arrival_time
  before_save :set_departure_time



  def set_station_number
    start_number = StationsRoute.where(route_id: route_id).maximum('station_number')
    start_number == nil ? start_number = 1 : start_number += 1
    self.station_number = start_number
  end

  def set_arrival_time
    self.arrival_time = DateTime.now
  end

  def set_departure_time
    self.departure_time = DateTime.now + 10.minutes
  end

end