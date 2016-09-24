class JournalsController < ApplicationController

  before_action :set_journal, only: [:show, :edit, :update, :destroy]
  before_action :set_chapter, only: [:index, :new, :destroy]
  before_action :check_permissions, only: [:edit, :update, :destroy]

  def index
    @journals = @chapter.journals
  end

  def show

  end

  def new
    @journal = Journal.new
  end

  def create
    @journal = Journal.create(journal_params)
    if @journal.save 
      redirect_to @journal.chapter
    else
      flash[:alert] = t(:there_was_a_problem)
      @errors = @journal.errors
      redirect_to @journal.chapter
    end
  end

  def update
    if @journal.update(journal_params)
      redirect_to journals_path, notice: t(:journal_update)
    else
      flash[:alert] = t(:there_was_a_problem)
      @errors = @journal.errors

      render action: :edit
    end
  end

  def destroy
    flash[:notice] = "No deletes until I finish soft delete/archival for safety reasons"
    redirect_to journals_path(@chapter)
  end

  private

  def set_journal
    @journal = Journal.includes(:chapter).find(params[:id])
  end

  def set_chapter
    @chapter = Chapter.find(params[:id])
  end

  def check_permissions
    redirect_to :root unless current_user == @journal.chapter.owner
  end

  def journal_params
    params.require(:journal).permit(:name, :chapter_id)
  end

end