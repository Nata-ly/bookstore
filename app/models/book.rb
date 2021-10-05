class Book < ApplicationRecord
  validates :title, :author, :price, presence: true
  validates :price, length: { minimum: 2 }
end
