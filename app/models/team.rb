class Team < ApplicationRecord
	# belongs_to :user
	validates_presence_of :name

	# Association for users as members of a team through team membership
	has_many :team_memberships, dependent: :destroy, class_name: "Teams::Membership"
	has_many :users, through: :team_memberships
end
