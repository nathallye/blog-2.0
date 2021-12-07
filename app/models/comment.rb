class Comment < ApplicationRecord
  validates :author, :body, presence: true #validações
  belongs_to :post #pertence a :post
end
