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
    SELECT DISTINCT routes.* FROM routes
      inner join stations_routes s1 on s1.route_id = routes.id
      inner join stations_routes s2 on s2.route_id = routes.id
        where s1.station_number < s2.station_number
        and s1.station_id = ?
        and s2.station_id = ?
    SQL
  end

  def set_name
    if  self.title == nil || self.title.empty?
      self.title = "#{stations.first.title} - #{stations.last.title}"
    end
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
