class Comment < ApplicationRecord
  belongs_to :book
  belongs_to :user
  validates :body, :estimate, presence: true
end
