class PlayHistory < ApplicationRecord
  validates :scenario_name, presence: true
  validates :play_style, presence: true
  validates :is_active, presence: true

  belongs_to :user
  belongs_to :title
  has_many :favorites, dependent: :destroy
  enum play_style: {gm: 0, player: 1}
  enum status: { published: 0, draft: 1 }

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
