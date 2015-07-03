class Relationship < ActiveRecord::Base
	belongs_to :follower, class_name: "User"
	belongs_to :followed, class_name: "User"

	validates_presence_of :follower_id, :followed_id
	validate :cannot_self_following

	def cannot_self_following
    errors.add(:follower, 'user cannot follow himself') if follower_id == followed_id
  end
end
