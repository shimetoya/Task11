class StationsRoute < ActiveRecord::Base
belongs_to :station
belongs_to :route

default_scope {order(:station_number)}
validates :station_number, uniqueness: {scope: :route_id}

end