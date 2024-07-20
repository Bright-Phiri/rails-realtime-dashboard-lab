# frozen_string_literal: true

class Author < ApplicationRecord
  include Broadcastable
  has_many :books, dependent: :destroy
  with_options presence: true do
    validates :name, :email, :phone, uniqueness: { case_sensitive: false }
  end
  attr_readonly :books_count
end
