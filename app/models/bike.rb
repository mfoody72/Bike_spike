class Bike < ActiveRecord::Base
	belongs_to :category
	has_many :comments
	has_many :reservations
  has_many :booked_days
	has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", small: "150x150>" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
	belongs_to :user

	def booked_for?(day)
    contained_in = false

    booked_days.each do |bd|
      if bd.date == day
        contained_in = true
      end
    end
    contained_in
  end



end
