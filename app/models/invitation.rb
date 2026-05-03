class Invitation < ApplicationRecord
  belongs_to :event
  belongs_to :attendee, class_name: "User"

  enum :response, { not_answered: 0, accepted: 1, declined: 2 }
end
