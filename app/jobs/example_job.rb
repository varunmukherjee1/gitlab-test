class ExampleJob < ApplicationJob
  queue_as :default

  def perform(message = "Hello from Sidekiq")
    Rails.logger.info("[ExampleJob] #{message}")
  end
end
