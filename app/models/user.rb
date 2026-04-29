class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  has_many :hosted_events, foreign_key: "host_id", class_name: "Event", inverse_of: "host", dependent: :destroy

  validates :username, presence: true

  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
