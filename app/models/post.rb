class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user

  validates :title, presence: true, length: {minimum: 5, maximum: 55}
  validates :body, presence: true, length: {minimum: 10}
end
