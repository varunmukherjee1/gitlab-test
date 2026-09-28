class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  has_many :events

  after_update_commit :notify_update

  def notify_update
    NotificationJob.perform_later(self.class.name, self.id)
  end
end
