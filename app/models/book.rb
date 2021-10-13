class Book < ApplicationRecord
  has_many :comments
  belongs_to :author
  belongs_to :category
  validates :title, :price, presence: true
  validates :price, length: { minimum: 2 }
end
