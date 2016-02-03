class Comment < ActiveRecord::Base
  belongs_to :article_params
  belongs_to :user
  
  validates :body, presence: true
  
end