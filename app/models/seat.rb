class Seat < ActiveRecord::Base
  validates :seat_type, presence: true
  belongs_to :car
  belongs_to :current_car, class_name: 'Car', foreign_key: :current_car_id

end
