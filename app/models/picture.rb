class Picture < ActiveRecord::Base
	has_attached_file :image, styles: {:thumb => "100x100", :medium => "300x300"}

	validates_attachment :image, content_type: {
		content_type: ['image/jpg', 'image/jpeg','image/png', 'image.gif']},
		size: {in: 0..5.megabytes}
end
