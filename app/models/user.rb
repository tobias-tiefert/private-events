class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  has_many :hosted_events, foreign_key: "host_id", class_name: "Event", inverse_of: "host", dependent: :destroy

  has_many :invitations, foreign_key: "attendee_id", inverse_of: "attendee", dependent: :destroy
  has_many :attending_events, through: :invitations, source: :event

  validates :username, presence: true

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  def self.invitation_for(event)
    if Current.user.nil?
      Invitation.new
    else
    Current.user.invitations.find_by(event_id: event.id) || Invitation.new
    end
  end

  def self.current_user_id
    Current.user.nil? ? 0 : Current.user.id
  end
end
