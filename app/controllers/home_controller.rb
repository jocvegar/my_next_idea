class HomeController < ApplicationController
	def home
		@packages = Package.on_going
		@finished_packages = Package.finished
		@users = User.all
	end
end
