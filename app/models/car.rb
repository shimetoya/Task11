class Car < ActiveRecord::Base
  belongs_to :train
  has_many :seats
  has_many :stations_routes
  has_many :stations, through: :stations_routes

  validates :car_type,  presence: true

  validates :number, uniqueness: {scope: :train_id}
  before_create :set_number

  private
  @@count = 1
  def set_number
    self.number = @@count
    @@count += 1
  end
  scope :orderedA, -> {order(number: :asc)}
  scope :orderedZ, -> {order(number: :desc)}
  scope :economy, -> {where(type: 'EconomyCar')}
  scope :coupe, -> {where(type: 'CoupeCar')}
  scope :sv, -> {where(car_type: 'SVCar')}
  scope :sitting, -> {where(type: 'SittingCar')}
end
