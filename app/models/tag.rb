class Tag < ActiveRecord::Base
  attr_accessible :name
  has_many :taggings
  has_many :articles, through: :taggings

  validates :name, :uniqueness => true, :presence => true
end
