class Local < ActiveRecord::Base
	belongs_to :user

	validates :address, presence: true, length: { minimum: 1 }
	validates :user, presence: true
end
