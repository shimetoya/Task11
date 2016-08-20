class Car < ActiveRecord::Base
  belongs_to :train

  has_many :stations_routes
  has_many :stations, through: :stations_routes

  validates :number, uniqueness: {scope: :train_id}
  before_create :set_number

  private
  def set_number
    self.number = self.train.cars.size + 1
  end
  scope :orderedA, -> {order(number: :asc)}
  scope :orderedZ, -> {order(number: :desc)}
  scope :economy, -> {where(type: 'EconomyCar')}
  scope :coupe, -> {where(type: 'CoupeCar')}
  scope :sv, -> {where(type: 'SVCar')}
  scope :sitting, -> {where(type: 'SittingCar')}
end
