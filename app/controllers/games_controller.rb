class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    @game.board[params[:index].to_i] = @game.current_symbol
    @game.switch_user
    @game.save!

    redirect_to game_path(@game)
  end

  def new
    @game = Game.new()
  end

  def create
    @game = Game.new(game_params)
    @game.board = (1..9).to_a
    @game.current_player = @game.player_1

    if @game.save
      redirect_to games_path
    else
      render :new
    end
  end

  private

  def game_params
    params[:game].permit(:player_1, :player_2)
  end
end
