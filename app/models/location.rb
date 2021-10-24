class Location < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true
  
  has_many :comments
  has_many :users, through: :categories

  scope :alpha, -> { order(:title) }
  
  def category_attributes=(atttr)
    self.category = Category.find_or_create_by(attr) if !attr[:name].blank? 
  end 
end
