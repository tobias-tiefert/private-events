class Event < ApplicationRecord
  validates :title, :description, :date, :time, :location, presence: true
end
