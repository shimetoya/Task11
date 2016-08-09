class Ticket < ActiveRecord::Base
  validates :fio, presence: true
  validates :first_station, presence: true
  validates :last_station, presence: true
  validates :train, presence: true

  belongs_to :user
  belongs_to :train
  belongs_to :first_station, class_name: 'Station', foreign_key: :first_station_id
  belongs_to :last_station, class_name: 'Station', foreign_key: :last_station_id

end
