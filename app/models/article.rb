class Article < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :city, presence: true, length: { minimum: 2, maximum: 50 }
  validates :country, presence: true, length: { minimum: 2, maximum: 50 }
  validates :description, presence: true, length: { minimum: 30 }
  validates :user_id, presence: true
end

