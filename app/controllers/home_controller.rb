class HomeController < ApplicationController
	def home
		@packages = Package.all
		@users = User.all
	end
end
