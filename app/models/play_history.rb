class PlayHistory < ApplicationRecord
  belongs_to :user
  enum play_style: {gm: 0, player: 1}
end
