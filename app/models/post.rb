class Post < ApplicationRecord
  validates :title, :author, :body, presence: true

  has_many :comments #tem vários :comments (has_many = plural)
  belongs_to :tag #pertence a :tag (belongs_to = singular)
end
