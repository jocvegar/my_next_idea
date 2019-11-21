class User < ApplicationRecord
	validates_uniqueness_of :email

	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
	:recoverable, :rememberable, :validatable

	# TEAM MEMBERSHIP - Association for users as members of a team through team management
	has_many :team_memberships, dependent: :destroy
	has_many :teams, through: :team_memberships

	def username
		username = self.first_name.to_s + " " + self.last_name.to_s
		return username.blank? ? self.email : username.strip
	end
end
