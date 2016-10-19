class Ticket < ActiveRecord::Base
  validates :fio, :passport_information, :first_station,:last_station, :train, presence: true

  belongs_to :user
  belongs_to :train
  belongs_to :first_station, class_name: 'Station', foreign_key: :first_station_id
  belongs_to :last_station, class_name: 'Station', foreign_key: :last_station_id

  after_create :send_notification
  after_destroy :send_notification2

  def route_name
    "#{first_station.title} - #{last_station.title}"
  end

  private

  def send_notification
    TicketsMailer.buy_ticket(self.user,self).deliver_now
  end
  def send_notification2
    TicketsMailer.delete_ticket(self.user,self).deliver_now
  end
end
