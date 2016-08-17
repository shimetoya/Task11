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

  def self.search(params)
    self.find_by_sql([self.search_query, params[:start_station_id], params[:end_station_id]])
  end

  def start_station
    self.stations.first
  end

  def end_station
    self.stations.last
  end

  private

  def self.search_query
    <<-SQL
      SELECT * FROM routes WHERE
        (SELECT station_id
         FROM stations_routes
         WHERE route_id = routes.id AND
               station_number = (SELECT MIN(station_number)
                           FROM stations_routes
                           WHERE route_id = routes.id)) = ? AND
        (SELECT station_id
         FROM stations_routes
         WHERE route_id = routes.id AND
               station_number = (SELECT MAX(station_number)
                           FROM stations_routes
                           WHERE route_id = routes.id)) = ?
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
