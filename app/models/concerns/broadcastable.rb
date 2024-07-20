# frozen_string_literal: true

module Broadcastable
  extend ActiveSupport::Concern

  included do
    after_commit :broadcast_update, on: [:create, :destroy]
  end

  private

  def broadcast_update
    DashboardBroadcastJob.perform_later
  end
end
