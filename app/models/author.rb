# frozen_string_literal: true

class Author < ApplicationRecord
  include Broadcastable
  has_many :books, dependent: :destroy
  validates :name, :email, :phone, presence: true
  attr_readonly :books_count
end
