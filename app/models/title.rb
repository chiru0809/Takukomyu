class Title < ApplicationRecord
  validates :name, presence: true
  
  has_many :users
  has_many :recruits
end
