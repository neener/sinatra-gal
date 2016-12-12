class Upload < ActiveRecord::Base
	belongs_to :category

	# has_attached_file :upload, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/public/uploads/missing.png"
 # 	validates_attachment_content_type :upload, content_type: /\Aimage\/.*\z/
end