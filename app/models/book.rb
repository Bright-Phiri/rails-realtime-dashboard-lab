# frozen_string_literal: true

class Book < ApplicationRecord
  include Broadcastable
  belongs_to :author, counter_cache: true
  validates :publisher, :section, presence: true
  with_options presence: true do
    validates :isbn, :name, uniqueness: { case_sensitive: false }
  end
  validates :quantity, numericality: { only_integer: true }
end
