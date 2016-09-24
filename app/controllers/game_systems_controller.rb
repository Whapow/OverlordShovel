class GameSystemsController < ApplicationController

  before_action :set_game_system, only: [:show, :edit, :update, :destroy]
  before_action :check_permissions#, only: [:edit, :update, :destroy]

  def index
    @game_systems = GameSystem.all
  end

  def show

  end

  def new
    @game_system = GameSystem.new
  end

  def create
    @game_system = GameSystem.create(game_system_params)
    if @game_system.save 
      redirect_to @game_system
    else
      flash[:alert] = t(:there_was_a_problem)
      @errors = @game_system.errors
      redirect_to new_game_system_path
    end
  end

  def update
    if @game_system.update(game_system_params)
      redirect_to game_systems_path, notice: t(:game_system_update)
    else
      flash[:alert] = t(:there_was_a_problem)
      @errors = @game_system.errors

      render action: :edit
    end
  end

  def destroy
    flash[:notice] = "No deletes until I finish soft delete/archival"
    redirect_to game_systems_path
  end

  private

  def set_game_system
    @game_system = GameSystem.find(params[:id])
  end

  def check_permissions
    redirect_to :root unless current_user == Player.find(1)
  end

  def game_system_params
    params.require(:game_system).permit(:name)
  end

end
