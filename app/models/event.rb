class Event < ApplicationRecord
  belongs_to :host, class_name: "User"
  validates :title, :description, :time, :location, presence: true
end
