class StationsRoute < ActiveRecord::Base
  belongs_to :station
  belongs_to :route

=begin
  default_scope {order(:station_number)}
=end

  validates :station_number, uniqueness: {scope: :route_id}


end