class User < ActiveRecord::Base
  acts_as_voter
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :pictures
  has_many :active_relationships, class_name: "Relationship",
  																foreign_key: "follower_id",
  																dependent: :destroy

  has_many :passive_relationships, class_name: "Relationship",
  																 foreign_key: "followed_id",
  																 dependent: :destroy

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  has_many :comments, through: :pictures

  def following?(other)
  	following.include?(other)
  end

  def follow(other)
  	active_relationships.create(followed_id: other.id)
  end

  def unfollow(other)
  	active_relationships.find_by(followed_id: other.id).destroy
  end

  def feed
    following_ids = "SELECT followed_id FROM relationships
                     WHERE follower_id = :user_id"
    Picture.where("user_id IN (#{following_ids}) OR user_id = :user_id",
                  user_id: id).order(created_at: :desc)
  end
end
