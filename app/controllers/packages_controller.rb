class PackagesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_manager!, only: [:create, :edit, :update, :destroy, :sort]
  before_action :set_package, only: [:show, :edit, :update, :destroy, :sort]

  # GET /packages
  # GET /packages.json
  def index
    if current_user.manager?
      @packages = Package.on_going.order('start_date')
    else
      @packages = []
      Package.on_going.order('start_date').each do |package|
        if package.publish? &&
          package.assigned_to_user?(current_user) &&
          package.assigment_that_belong_to_user(current_user).started == true &&
          package.assigment_that_belong_to_user(current_user).finished ==  false
          @packages << package
        end
      end
      return @packages
    end
  end

  # GET /packages/1
  # GET /packages/1.json
  def show
  end

  # GET /packages/new
  def new
    @package = Package.new
  end

  # GET /packages/1/edit
  def edit
  end

  # POST /packages
  # POST /packages.json
  def create
    @package = Package.new(package_params)

    respond_to do |format|
      if @package.save
        format.html { redirect_to @package, notice: 'Proceso creado correctamente' }
        format.json { render :show, status: :created, location: @package }
      else
        format.html { render :new }
        format.json { render json: @package.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /packages/1
  # PATCH/PUT /packages/1.json
  def update
    respond_to do |format|
      if @package.update(package_params)
        format.html { redirect_to @package, notice: 'Proceso actualizado correctamente' }
        format.json { render :show, status: :ok, location: @package }
      else
        format.html { render :edit }
        format.json { render json: @package.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /packages/1
  # DELETE /packages/1.json
  def destroy
    @package.destroy
    respond_to do |format|
      format.html { redirect_to packages_url, notice: 'Proceso eliminado correctamente' }
      format.json { head :no_content }
    end
  end

  def sort
    @assigments = @package.assigments

    params[:assigment]["0"].each_with_index do |id, index|
      Assigment.where(id: id.to_i).update_all(position: index + 1)
    end

    respond_to do |f|
      f.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_package
      @package = Package.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def package_params
      params.require(:package).permit(:title, :publish, :start_date, :finish_date, :team_ids => [])
    end
end
