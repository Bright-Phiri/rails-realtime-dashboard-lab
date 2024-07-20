class Author < ApplicationRecord
  has_many :books, dependent: :destroy
  validates :name, :email, :phone, presence: true
  attr_readonly :books_count
end
