class Event < ApplicationRecord
  belongs_to :host, class_name: "User"
  has_many :invitations, dependent: :destroy
  has_many :attendees, through: :invitations

  validates :title, :description, :date, :time, :location, presence: true
  validates :date, comparison: { greater_than_or_equal_to: Time.zone.today }

  enum :visibility, { private_event: 0, public_event: 1 }

  scope :past, -> { where(date: ...Time.zone.today).order(date: :desc) }
  scope :upcomming, -> { where(date: Time.zone.today..).order(date: :asc) }

  def past?
    date < Time.zone.today
  end

  def upcomming?
    date >= Time.zone.today
  end
end
