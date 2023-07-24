class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  belongs_to :title, optional: true
  has_many :recruits, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :play_histores, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  has_many :follows, class_name: "Follow", foreign_key: "follower_id", dependent: :destroy
  has_many :followeds, class_name: "Follow", foreign_key: "followee_id", dependent: :destroy
  
  has_many :following_users, through: :follows, source: :followee
  has_many :follower_users, through: :followees, source: :follower
  
  enum main_playstyle: { gm_only: 0, gm_trend: 1, both: 2, player_trend: 3, player_only: 4}

  has_one_attached :profile_image

  def get_profile_image(width,height)
    unless profile_image.attached?
     file_path = Rails.root.join('app/assets/images/user_default.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'user_default.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
  
  def follow(user_id)
    follows.create(followee_id: user_id)
  end
  
  def unfollow(user_id)
    follows.find_by(followee_id: user_id).destroy
  end
  
  def following?(user)
    following_users.include?(user)
  end
  
end
