class CharactersController < ApplicationController

  before_action :set_character, only: [:show, :edit, :update, :destroy]
  before_action :set_player
  before_action :set_campaigns, only: [:new, :edit]
  before_action :check_permissions, only: [:edit, :update, :destroy]

  def index
    @characters = @player.characters.includes(:campaign)
  end

  def show

  end

  def new
    @character = Character.new
  end

  def create
    @character = @player.characters.create(character_params)
    if @character.save 
      redirect_to player_characters_path(@player)
    else
      flash[:alert] = t(:there_was_a_problem)
      @errors = @character.errors

      redirect_to new_player_character_path(@player)
    end
  end

  def update
    if @character.update(character_params)
      redirect_to player_characters_path, notice: t(:character_update)
    else
      flash[:alert] = t(:there_was_a_problem)
      @errors = @character.errors

      render action: :edit
    end
  end

  def destroy
    flash[:notice] = "No deletes until I finish soft delete/archival for safety reasons"
    redirect_to player_characters_path(current_user)
  end

  private

  def set_character
    @character = Character.includes(:player, :campaign).find(params[:id])
  end

  def set_player
    @player = Player.find(params[:player_id])
  end

  def set_campaigns
    @campaigns = Campaign.all
  end

  def check_permissions
    redirect_to :root unless current_user == @character.player
  end

  def character_params
    params.require(:character).permit(:name, :campaign_id, :player_id)
  end

end