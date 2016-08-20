class Route < ActiveRecord::Base
  validates :title, presence: true

  #маршрут может иметь много станций, стании могут быть на разных маршрутах, связь много-много
  has_many :stations_routes
  has_many :stations, through: :stations_routes


  #маршрут может иметь много поездов, связь 1 к многим
  has_many :trains
  validate :stations_count

  before_validation :set_name
  before_save :station_number


  private


  def self.search_query
    <<-SQL
      SELECT routes.id, title FROM routes INNER JOIN stations_routes ON routes.id = stations_routes.route_id
        WHERE station_number = ? OR station_number = ?
    SQL
  end

  def set_name
    self.title = "#{stations.first.title} - #{stations.last.title}"
  end

  def stations_count
    if stations.size < 2
      errors.add(:base, "Route should contain at least 2 stations")
    end
  end

  def station_number
    count = 1
    self.stations_routes.each do |station|
      station.station_number = count
      count += 1
    end
  end
end
