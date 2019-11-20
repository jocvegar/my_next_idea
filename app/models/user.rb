class User < ApplicationRecord
	validates_uniqueness_of :email

	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
	:recoverable, :rememberable, :validatable

	def username
		username = self.first_name.to_s + " " + self.last_name.to_s
		return username.blank? ? self.email : username.strip
	end
end
