class Book < ApplicationRecord
  has_many :comments
  belongs_to :author
  validates :title, :author, :price, presence: true
  validates :price, length: { minimum: 2 }
end
