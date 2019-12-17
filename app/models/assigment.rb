class Assigment < ApplicationRecord
	acts_as_list scope: :package

	belongs_to :team
	belongs_to :package

	def belongs_to_user?(user)
		self.team.users.include?(user)
	end

end
