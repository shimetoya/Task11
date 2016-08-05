class Car < ActiveRecord::Base
  validates :car_type, presence: true
  belongs_to :train
  has_many :seats
  has_many :stations_routes
  has_many :stations, through: :stations_routes
end
