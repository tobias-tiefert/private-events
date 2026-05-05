class Event < ApplicationRecord
  belongs_to :host, class_name: "User"
  has_many :invitations, dependent: :destroy
  has_many :attendees, through: :invitations

  validates :title, :description, :date, :time, :location, presence: true
  validates :date, comparison: { greater_than_or_equal_to: Time.zone.today }, on: :create

  enum :visibility, { private_event: 0, public_event: 1 }

  scope :public_event, -> { where(visibility: "public_event") }
  scope :invited, -> { where(invitations: { attendee_id: Current.user }) }
  scope :hosted, -> { where(host_id: Current.user.id) }

  scope :past, -> { where(date: ...Time.zone.today).order(date: :desc) }
  scope :upcomming, -> { where(date: Time.zone.today..).order(date: :asc) }

  def past?
    date < Time.zone.today
  end

  def upcomming?
    date >= Time.zone.today
  end

  def self.visible
    if Current.user.nil?
      includes(:invitations).public_event
    else

      includes(:invitations).public_event.or(includes(:invitations).hosted)
                            .or(includes(:invitations).invited)
    end
  end
end
