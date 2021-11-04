class Book < ApplicationRecord
  has_many :comments
  belongs_to :author
  belongs_to :category
  validates :title, :price, presence: true
  validates :price, length: { minimum: 2 }

  scope :by_author,       ->(author)   { where(author_id: author) if author}
  scope :by_category,     ->(category) { where(category_id: category) if category }

end
