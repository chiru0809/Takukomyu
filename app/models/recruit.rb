class Recruit < ApplicationRecord
  validates :scenario_name, presence: true
  validates :message, presence: true

  enum status: { published: 0, draft: 1 }

  belongs_to :user
  belongs_to :title
  has_many :comments, dependent: :destroy
end
