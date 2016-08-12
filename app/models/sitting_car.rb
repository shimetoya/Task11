class SittingCar < Car
  validates :amount_sitting_seats, presence: true
end