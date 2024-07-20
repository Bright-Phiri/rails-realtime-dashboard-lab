# frozen_string_literal: true

class DashboardChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'dashbaord_channel'
  end

  def unsubscribed
    stop_all_streams
  end

  on_subscribe do
    ActionCable.server.broadcast 'dashbaord_channel', { books_count: Book.count, authors_count: Author.count }
  end
end
