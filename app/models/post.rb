class Post < ApplicationRecord

  validates :title, presence: true, uniqueness: true, length: { in: 3..30 }
  validates :body, presence: true, length: { in: 10..1000 }
end
