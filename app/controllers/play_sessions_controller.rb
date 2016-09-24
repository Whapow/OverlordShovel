class PlaySessionsController < ApplicationController

  before_action :set_play_session, only: [:show, :edit, :update, :destroy]
  before_action :set_journal, only: [:index, :new, :destroy]
  before_action :check_permissions, only: [:edit, :update, :destroy]

  def index
    @play_sessions = @journal.play_sessions
  end

  def show

  end

  def new
    @play_session = PlaySession.new
  end

  def create
    @play_session = PlaySession.create(play_session_params)
    if @play_session.save 
      redirect_to @play_session
    else
      flash[:alert] = t(:there_was_a_problem)
      @errors = @play_session.errors
      redirect_to new_play_session_path
    end
  end

  def update
    if @play_session.update(play_session_params)
      redirect_to play_sessions_path, notice: t(:play_session_update)
    else
      flash[:alert] = t(:there_was_a_problem)
      @errors = @play_session.errors

      render action: :edit
    end
  end

  def destroy
    flash[:notice] = "No deletes until I finish soft delete/archival for safety reasons"
    redirect_to play_sessions_path(@journal.campaign)
  end

  private

  def set_play_session
    @play_session = PlaySession.includes(journal:[:campaign]).find(params[:id])
  end

  def set_journal
    @journal = Journal.includes(:campaign).find(params[:id])
  end

  def check_permissions
    redirect_to :root unless current_user == @play_session.journal.campaign.owner
  end

  def play_session_params
    params.require(:play_session).permit(:description, :journal_id)
  end

end