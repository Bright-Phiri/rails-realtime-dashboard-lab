class Book < ApplicationRecord
  belongs_to :author, counter_cache: true
  validates :isbn, :name, :publisher, :section, presence: true
  validates :quantity, numericality: { only_integer: true }

  after_commit :broadcast_dashboard_update, on: :create

  private

  def broadcast_dashboard_update
    DashboardBroadcastJob.perform_later
  end
end
