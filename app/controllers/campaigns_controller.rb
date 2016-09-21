class CampaignsController < ApplicationController

  before_action :set_campaign, only: [:show, :update, :destroy]

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
      render action: :new
    end
  end

  def update

  end

  def destroy

  end

  private

  def set_campaign
    @campaign = Campaign.find(params[:id])
  end

  def campaign_params
    params.require(:campaign).permit(:name, :system)
  end

end
