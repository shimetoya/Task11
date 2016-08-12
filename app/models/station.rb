class Station < ActiveRecord::Base
  validates :title, presence: true

  has_many :trains
  has_many :tickets
  has_many :tickets


  #has_and_belongs_to_many :routes
  has_many :stations_routes
  has_many :routes, through: :stations_routes


end
