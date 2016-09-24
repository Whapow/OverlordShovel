class PlayersController < ApplicationController

  skip_before_action :authorize, only: [:new_registration, :create_registration]
  before_action :set_player, only: [:show, :edit, :delete]
  before_action :check_permissions, only: [:edit, :delete]

  def index
    @players = Player.all
  end

  def show

  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.create(player_params)
    if @player.save 
      # flash[:notice] = "An invitation email has been sent to #{@player.first_name}!"
      redirect_to :players
    else
      flash[:alert] = t(:there_was_a_problem)
      @errors = @player.errors
      render action: :new
    end
  end

  def update

  end

  def destroy
    flash[:notice] = "No deletes until I finish soft delete/archival for safety reasons"
    redirect_to players_path
  end

  def new_registration
    @player = Player.new
  end

  def create_registration
    @player = Player.create(player_params.except(:confirm_password))
    if player_params[:password] == player_params[:confirm_password]
      if @player.save 
        session[:user_id] = @player.id
        flash[:notice] = "Welcome to Overlord Shovel!"
        redirect_to :root
      else
        flash[:alert] = t(:there_was_a_problem)
        @errors = @player.errors
        render action: :new_registration
      end
    else
      flash[:alert] = t(:password_mismatch)
      render action: :new_registration
    end  
  end

  private

  def player_params
    params.require(:player).permit(:first_name, :last_name, :email, :password, :confirm_password)
  end

  def set_player
    @player = Player.find(params[:id])    
  end

  def check_permissions
    redirect_to :root unless current_user == @player
  end

end
