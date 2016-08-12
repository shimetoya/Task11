class Route < ActiveRecord::Base
  validates :title, presence: true

  #маршрут может иметь много станций, стании могут быть на разных маршрутах, связь много-много
  has_many :stations_routes
  has_many :stations, through: :stations_routes


  #маршрут может иметь много поездов, связь 1 к многим
  has_many :trains
  validate :stations_count

  before_validation :set_name

  private
  def set_name
    self.title = "#{stations.first.title} - #{stations.last.title}"
  end

  def stations_count
    if stations.size < 2
      errors.add(:base, "Route should contain at least 2 stations")
    end
  end

end
