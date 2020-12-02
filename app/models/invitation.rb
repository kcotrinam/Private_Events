class Invitation < ApplicationRecord
  belongs_to :attendee, class_name: 'User', foreign_key: 'attendee_id'
  belongs_to :attended_event, class_name: 'Event', foreign_key: 'attended_event_id'

  validates :attendee_id, uniqueness: { scope: :attended_event_id}
end