class Station < ActiveRecord::Base
  validates :title, presence: true
end
