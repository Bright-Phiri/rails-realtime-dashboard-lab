class Author < ApplicationRecord
  has_many :books, dependent: :destroy
  validates :name, :email, :phone, presence: true
  attr_readonly :books_count

  after_commit :broadcast_dashboard_update, on: :create

  private

  def broadcast_dashboard_update
    DashboardBroadcastJob.perform_later
  end
end
