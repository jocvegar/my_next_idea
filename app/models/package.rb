class Package < ApplicationRecord
	validates_presence_of :title, :start_date

	has_many :assigments, -> { order(position: :asc) }, dependent: :destroy
	accepts_nested_attributes_for :assigments, allow_destroy: true, reject_if: :all_blank
	has_many :teams, through: :assigments
end
