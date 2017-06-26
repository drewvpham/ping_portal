class GamesController < ApplicationController
  def new
    @game=Game.new
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
  end



  private

  def game_params
    params.require(:game).permit( :player_1_id, :player_2_id, :player_1_score, :player_2_score, :winner, :time, :location)
  end
end
