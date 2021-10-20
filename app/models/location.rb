class Location < ApplicationRecord
  belongs_to :user
  belongs_to :category
  
  has_many :comments
  has_many :users, through: :categories
  
end
