class Recruit < ApplicationRecord
  # validates :title_id, presence: true
  validates :scenario_name, presence: true
  validates :message, presence: true
  # validates :recruit_status, presence: true
  
  belongs_to :user
  belongs_to :title
end
