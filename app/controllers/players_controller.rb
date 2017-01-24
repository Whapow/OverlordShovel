class PlayersController < ApplicationController

  skip_before_action :authorize, only: [:new_registration, :create_registration]
  before_action :set_player, except: [:change_password, :update_password]
  before_action :set_player_from_alternate_params, only: [:change_password, :update_password]
  before_action :check_permissions, only: [:edit, :delete]

  def index
    @players = Player.all
  end

  def show

  end

  def edit
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
    if @player.update(player_params.except(:confirm_password)) && player_params[:password] == player_params[:confirm_password]
      redirect_to @player, notice: t(:player_update)
    else
      flash[:alert] = t(:there_was_a_problem)
      @errors = @player.errors

      render action: :edit
    end
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

  def change_password
    
  end

  def update_password
    if @player.valid_password?(player_params[:current_password]) && player_params[:password] == player_params[:confirm_password]
      if @player.update(player_params.except(:confirm_password, :current_password))
        redirect_to @player, notice: t(:player_update)
      else
        flash[:alert] = t(:there_was_a_problem)
        @errors = @player.errors

        render action: :edit
      end
    else
      flash[:alert] = t(:password_mismatch)
      render action: :new_registration
    end  
  end

  private

  def player_params
    params.require(:player).permit(:first_name, :last_name, :email, :password, :confirm_password, :current_password)
  end

  def set_player
    @player = Player.find(params[:id])    
  end

  def set_player_from_alternate_params
    @player = Player.find(params[:player_id])
  end

  def check_permissions
    redirect_to :root unless current_user == @player
  end

end
