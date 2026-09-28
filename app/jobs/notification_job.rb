class NotificationJob < ApplicationJob
  queue_as :default

  def perform(record_class, record_id)
    record = record_class.constantize.find_by(id: record_id)

    return unless record


    puts "NOTIFICATION: #{record_class} with id #{record_id} was updated!!!"
  end
end
