class DashboardBroadcastJob < ApplicationJob
  queue_as :default

  def perform
    ActionCable.server.broadcast 'dashbaord_channel', { books_count: Book.count, authors_count: Author.count }
  end
end
