class CampaignsController < ApplicationController

  before_action :set_campaign, only: [:show, :edit, :update, :destroy]
  before_action :check_permissions, only: [:edit, :update, :destroy]
  before_action :set_game_systems, only: [:new, :edit]

  def index
    @campaigns = Campaign.all
  end

  def show

  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.create(campaign_params)
    if @campaign.save 
      redirect_to @campaign
    else
      flash[:alert] = t(:there_was_a_problem)
      @errors = @campaign.errors
      redirect_to new_campaign_path
    end
  end

  def update
    if @campaign.update(campaign_params)
      redirect_to campaigns_path, notice: t(:campaign_update)
    else
      flash[:alert] = t(:there_was_a_problem)
      @errors = @campaign.errors

      render action: :edit
    end
  end

  def destroy
    flash[:notice] = "No deletes until I finish soft delete/archival"
    redirect_to campaigns_path
  end

  private

  def set_campaign
    @campaign = Campaign.includes(chapters:[journals: [:appearances]]).find(params[:id])
  end

  def set_game_systems
    @game_systems = GameSystem.all.order(:name)
  end

  def check_permissions
    redirect_to :root unless current_user == @campaign.owner
  end

  def campaign_params
    params.require(:campaign).permit(:name, :game_system_id, :owner_id)
  end

end
