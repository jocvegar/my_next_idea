class TeamsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  before_action :set_users

  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.all
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)

    respond_to do |format|
      puts "@team.valid? :#{@team.valid?}"
      puts "@team.errors.full_messages :#{@team.errors.full_messages}"
      if @team.save
        format.html { redirect_to @team, notice: 'Departamento creado!' }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to teams_path, notice: 'Departamento actualizado!' }
        format.json { render :show, status: :ok, location: @team }
      else
        @error = "No se puede actualizar. #{error_notice @team} #{user_results[:errors].to_a.to_sentence}"
        format.html do
          flash.now[:notice] = @error
          render :edit
        end
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: 'Departamento borrado!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:name, :user_ids => [])
    end

    def set_users
      @users = User.left_outer_joins(:team_memberships).where( team_memberships: { id: nil } )
    end
end
