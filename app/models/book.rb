class Book < ApplicationRecord
  belongs_to :author, counter_cache: true
  validates :isbn, :name, :publisher, :section, presence: true
  validates :quantity, numericality: { only_integer: true }
end
