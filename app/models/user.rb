class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :comments
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_validation :normalize_username, on: :create

  private

  def normalize_username
    self.username = username.downcase.titleize
  end

end
