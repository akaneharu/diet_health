class Post < ApplicationRecord
  
  has_one_attached :post_image
  belongs_to :user
  has_many :post_image, dependent: :destroy
  
  validates :body, presence: true, length: { maximum: 500 }
  
end
