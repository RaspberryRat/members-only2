class Post < ApplicationRecord

  validates :title, presence: true, uniqueness: true, length: { in: 3..30 }
  validates :body, presence: true, length: { in: 10..10000 }

  belongs_to :user
end
