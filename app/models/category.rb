class Category <ActiveRecord::Base
	belongs_to :user
	has_many :uploads

	validates :title, presence: true
end