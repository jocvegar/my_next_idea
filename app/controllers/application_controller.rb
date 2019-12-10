class ApplicationController < ActionController::Base
	include Pundit
	protect_from_forgery

	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

	def authenticate_manager!
	  unless current_user.manager?
	    raise NotAuthorizedError
	  end
	end

	private

	def user_not_authorized
		flash[:alert] = "No estas autorizado para realizar esta acción"
		redirect_to(request.referrer || root_path)
	end
end
