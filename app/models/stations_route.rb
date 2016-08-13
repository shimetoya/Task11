class StationsRoute < ActiveRecord::Base
belongs_to :station
belongs_to :route

default_scope {order(:station_number)}

validates :station_number, uniqueness: {scope: :route_id}
before_validation :set_number

private
@@count = 1
def set_number
  self.station_number = @@count
  @@count += 1
end
end