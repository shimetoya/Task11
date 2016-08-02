class Route < ActiveRecord::Base
  validates :title, presence: true

  #has_and_belongs_to_many :stations

  #маршрут может иметь много станций, стании могут быть на разных маршрутах, связь много-много
  has_many :stations_routes
  has_many :stations, through: :stations_routes

 #маршрут может иметь много поездов, связь 1 к многим
  has_many :trains
end
