class Event < ApplicationRecord
  belongs_to :user
  has_many :invitations, foreign_key: :attended_event_id
  has_many :attendees, through: :invitations

  validates :title, :description, :date, presence: true, length: { maximum: 50 }

  scope :comming_events, -> { where('date > ?', DateTime.now) }
  scope :past_events, -> { where('date < ?', DateTime.now) }
end
