class Event < ApplicationRecord
  belongs_to :user, optional: :true

  after_update_commit :notify_update

  def notify_update
    NotificationJob.perform_later(self.class.name, self.id)
  end
end
