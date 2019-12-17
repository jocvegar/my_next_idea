class AssigmentsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_assigment

	def update
		respond_to do |format|
			if @assigment.update(started: true, finished: true)
				if @assigment.last?
					@assigment.package.update(terminado: true)
				else
					@assigment.lower_item.update(started: true)
				end
				format.html { redirect_to @assigment.package, notice: 'Proceso finalizado' }
			else
				format.html { redirect_to @assigment.package, notice: 'Ocurrio un error tratar de nuevo' }
			end
		end
	end

	private

	def set_assigment
		@assigment = Assigment.find(params[:id])
	end

end
