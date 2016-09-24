class ChaptersController < ApplicationController

  before_action :set_chapter, only: [:show, :edit, :update, :destroy]
  before_action :set_campaign, only: [:index, :new, :destroy]
  before_action :check_permissions, only: [:edit, :update, :destroy]

  def index
    @chapters = @campaign.chapters
  end

  def show

  end

  def new
    @chapter = Chapter.new
  end

  def create
    @chapter = Chapter.create(chapter_params)
    if @chapter.save 
      redirect_to @chapter.campaign
    else
      flash[:alert] = t(:there_was_a_problem)
      @errors = @chapter.errors
      redirect_to :back
    end
  end

  def update
    if @chapter.update(chapter_params)
      redirect_to chapters_path, notice: t(:chapter_update)
    else
      flash[:alert] = t(:there_was_a_problem)
      @errors = @chapter.errors

      render action: :edit
    end
  end

  def destroy
    flash[:notice] = "No deletes until I finish soft delete/archival for safety reasons"
    redirect_to chapters_path(@campaign)
  end

  private

  def set_chapter
    @chapter = Chapter.includes(:campaign).find(params[:id])
  end

  def set_campaign
    @campaign = Campaign.find(params[:id])
  end

  def check_permissions
    redirect_to :root unless current_user == @chapter.campaign.owner
  end

  def chapter_params
    params.require(:chapter).permit(:name, :campaign_id)
  end

end