class GamesController < ApplicationController
  def new
    @game=Game.new
    @user=User.find(session[:user_id])
    @users=User.all
  end

  def create
      @game= Game.create(game_params)
      @user=User.find(session[:user_id])
      if @game.valid?
        redirect_to user_path(@user)
      else
        flash[:errors]= @game.errors.full_messages
        redirect_to :back
      end
  end

  def update
    game = Game.find(params[:id])

    if game_params[:player_1_score] > game_params[:player_2_score]
      game.update(game_params.merge(winner: game.player_1))
    else
      game.update(game_params.merge(winner: game.player_2))
    end
    game.update(game_params)


    if game.valid?
      redirect_to :back, notice: 'Thanks for submitting your scores!'
    else
      flash[:errors] = game.errors.full_messages
      redirect_to "/games/#{game.id}"
    end
  end

  def show
    @current_game = Game.find(params[:id])
    @player_1 = current_game.player_1.username
    @player_2 = current_game.player_2.username
  end


  private

  def game_params
    params.require(:game).permit( :player_1_id, :player_2_id, :player_1_score, :player_2_score, :winner, :time, :location)
  end

  def current_game
      @game = Game.find(params[:id])
  end
end
