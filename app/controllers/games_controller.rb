class GamesController < ApplicationController
  def new
    @game=Game.new
    @user=User.find(session[:user_id])
    @users=User.all
  end

  def create
      @game = Game.create(game_params)
      @user = User.find(session[:user_id])
      if @game.valid?
        redirect_to user_path(@user)
      else
        flash[:errors] = @game.errors.full_messages
        redirect_to :back
      end
  end

  def update
    # fail
    puts game_params.inspect
    game = Game.find(params[:id])
    if game_params[:player_1_score].to_i > game_params[:player_2_score].to_i
      Game.update(params[:id], game_params.merge(winner: game.player_1))
    else
      game = Game.update(params[:id], game_params.merge(winner: game.player_2))
    end
    total_points_player_1 = Game.where(player_1: game.player_1).sum(:player_1_score)
    points_against_player_1 = Game.where(player_1: game.player_1).sum(:player_2_score)

    total_points_player_1 += Game.where(player_2: game.player_1).sum(:player_2_score)
    points_against_player_1 += Game.where(player_2: game.player_1).sum(:player_1_score)

    total_points_player_2 = Game.where(player_1: game.player_2).sum(:player_1_score)
    points_against_player_2 = Game.where(player_1: game.player_2).sum(:player_2_score)

    total_points_player_2 += Game.where(player_2: game.player_2).sum(:player_2_score)
    points_against_player_2 += Game.where(player_2: game.player_2).sum(:player_1_score)

    User.update(game.player_1.id, points_for: total_points_player_1, points_against: points_against_player_1)
    User.update(game.player_2.id, points_for: total_points_player_2, points_against: points_against_player_2)
    # game.player_1.update(points_for: total_points_player_1)
    # User.find(game_params[:player_1_id]).points_against += game_params[:player_2_score].to_i
    # User.find(game_params[:player_2_id]).points_for += game_params[:player_2_score].to_i
    # User.find(game_params[:player_2_id]).points_against += game_params[:player_1_score].to_i

    if game.valid?
      redirect_to '/home', notice: 'Thanks for submitting your scores!'
    else
      flash[:errors] = game.errors.full_messages
      redirect_to "/games/#{game.id}"
    end
  end

  def show
    @game = current_game
    @player_1 = @game.player_1.username
    @player_2 = @game.player_2.username
  end

  private

  def game_params
    params.require(:game).permit( :player_1_id, :player_2_id, :player_1_score, :player_2_score, :time, :location)
  end

  def current_game
    Game.find(params[:id])
  end
end
