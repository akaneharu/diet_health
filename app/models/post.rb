class Post < ApplicationRecord
  
  has_one_attached :image
  belongs_to :user
  
  validates :body, presence: true, length: { maximum: 500 }
  
end
