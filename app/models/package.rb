class Package < ApplicationRecord
	validates_presence_of :title, :start_date

	has_many :assigments, -> { order(position: :asc) }, dependent: :destroy
	accepts_nested_attributes_for :assigments, allow_destroy: true, reject_if: :all_blank
	has_many :teams, through: :assigments

	before_save :initiate_assigment, :if => :publish_changed?

	def assigned_to_user?(user)
		self.assigments.map(&:team).map(&:users).flatten.include?(user)
	end

	def assigment_that_belong_to_user(user)
		self.assigments.select { |assigment| user.teams.include?(assigment.team) }.first
	end

	private

	def initiate_assigment
		if self.publish == true && self.assigments
			self.assigments.where(position: 1).update(started: true)
		end
	end


end
