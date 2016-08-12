class SVCar < Car
  validates :amount_bottom_seats,:amount_top_seats, presence: true
end