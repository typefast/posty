class Comment < ActiveRecord::Base
  
  validates :title, presence: true, length: {minimum: 2}
  validates :body, presence: true, length: {minimum: 5}  
  belongs_to :post
end
