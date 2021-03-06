class AppearancesController < ApplicationController

  before_action :set_appearance, only: [:show, :edit, :update, :destroy]
  before_action :set_journal
  before_action :set_characters, only: [:new, :edit]
  before_action :check_permissions, only: [:edit, :update, :destroy]

  def new
    @appearance = Appearance.new
  end

  def create
    @appearance = Appearance.create(appearance_params)
    @appearance.journal = @journal
    if @appearance.save 
      redirect_to campaign_chapter_path(@appearance.journal.chapter.campaign, @appearance.journal.chapter)
    else
      flash[:alert] = t(:there_was_a_problem)
      @errors = @appearance.errors
      redirect_to new_campaign_chapter_journal_appearance_path(@journal.chapter.campaign, @journal.chapter, @journal)
    end
  end

  def update
    if @appearance.update(appearance_params)
      redirect_to campaign_chapter_path(@appearance.journal.chapter.campaign, @appearance.journal.chapter), notice: t(:appearance_update)
    else
      flash[:alert] = t(:there_was_a_problem)
      @errors = @appearance.errors

      render action: :edit
    end
  end

  def destroy
    flash[:notice] = "No deletes until I finish soft delete/archival for safety reasons"
    redirect_to @appearance.journal.chapter
  end

  private

  def set_appearance
    @appearance = Appearance.includes(journal:[chapter:[:campaign]]).find(params[:id])
  end

  def set_journal
    @journal = Journal.includes(:chapter).find(params[:journal_id])
  end

  def set_characters
    if current_user == @journal.campaign.owner 
      @characters = @journal.campaign.characters
    else
      @characters = @journal.campaign.characters.where(player_id: current_user.id)
    end  
  end

  def check_permissions
    redirect_to :root unless current_user == @appearance.journal.campaign.owner
  end

  def appearance_params
    params.require(:appearance).permit(:character_id, :journal_id, :experience_value, :reward_value)
  end

end