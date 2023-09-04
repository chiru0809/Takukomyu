class Recruit < ApplicationRecord
  validates :scenario_name, presence: true, length: { minimum: 1, maximum: 40 }
  validates :message, presence: true

  enum status: { published: 0, draft: 1 }

  belongs_to :user
  belongs_to :title
  has_many :comments, dependent: :destroy
end
