class EconomyCar < Car
  validates :amount_side_top_seats, :amount_side_bottom_seats,:amount_top_seats, :amount_bottom_seats, presence: true
end