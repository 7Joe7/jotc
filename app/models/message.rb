class Message < ActiveRecord::Base
  belongs_to :user

  default_scope -> { order(created_at: :desc) }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :content, presence: true, length: {maximum: 2000}
  validates :email, presence: true, length: {maximum: 255}, format: {with: VALID_EMAIL_REGEX}

  before_save { email.downcase! }

  def send_new_message
    MessageMailer.message_received(self).deliver
    MessageMailer.new_task(self).deliver
  end
end
