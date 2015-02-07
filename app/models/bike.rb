class Bike < ActiveRecord::Base
	belongs_to :category
	has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", small: "150x150>" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
	belongs_to :user
end
