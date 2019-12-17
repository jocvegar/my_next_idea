class FinishedPackagesController < ApplicationController
	before_action :authenticate_user!

	def index
	    @packages = Package.finished.order('start_date')
	end
end
