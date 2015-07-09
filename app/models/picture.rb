class Picture < ActiveRecord::Base
	acts_as_votable
	belongs_to :user
	has_many :comments

	has_attached_file :image, styles: {:thumb => "100x100#", :small => "200x200#", :medium => "300x300#"}

	validates_presence_of :image
	validates :caption, presence: true, length: {maximum: 255}

	validates_attachment :image, content_type: {
		content_type: ['image/jpg', 'image/jpeg','image/png', 'image.gif']},
		size: {in: 0..5.megabytes}
end
