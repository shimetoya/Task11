class StationsRoute < ActiveRecord::Base
  belongs_to :station
  belongs_to :route

  default_scope {order(:station_number)}
  validates :station_number, uniqueness: {scope: :route_id}
=begin
  before_validation :station_number

  private
  def station_number
    self.station_number ||= 1
    self.station_number = station.station_number.max + 1
    self.arrival_time=Time.now
  end
=end
end