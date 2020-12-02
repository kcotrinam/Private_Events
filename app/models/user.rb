class User < ApplicationRecord

  has_many :invitations, foreign_key: :attendee_id
  has_many :attended_events, through: :invitations
  has_many :events
  validates :name, :email, presence: { message: '- The field can not be empty' }
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP,
    message: '- Please type an email'}

  def user_comming_events
    attended_events.comming_events
  end

  def user_past_events
    attended_events.past_events
  end
end
