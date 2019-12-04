class Package < ApplicationRecord
	validates_presence_of :title, :start_date

	has_many :assigments, -> { order(position: :asc) }, dependent: :destroy
	has_many :teams, through: :assigments
end
