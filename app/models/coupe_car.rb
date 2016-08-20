class CoupeCar < Car
  validates :amount_top_seats, :amount_bottom_seats, presence: true

end