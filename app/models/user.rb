class User <ActiveRecord::Base
	has_many :categories
	has_many :uploads, :through => :categories

	validates :username, :email, :password, presence: true

	has_secure_password

	def slug
		username.downcase.gsub(" ","-")
	end

	def self.find_by_slug(slug)
		User.all.find{|user| user.slug == slug}
	end
end