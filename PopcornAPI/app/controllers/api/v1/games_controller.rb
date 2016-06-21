class Api::V1::GamesController < ApplicationController
  respond_to :json, :html

  def index
    games = Game.all
    render json: games
  end

  def create
    game = Game.create(game_params)
    turn = Turn.create(game_id: game.id, player_id: 1)
    if game.save
      render json: game, status: 201
    end
  end

  def show
    game = Game.find(params[:id])
    render json: game
  end

  private

  def game_params
    params.require(:data).require(:attributes).permit(:name)
  end
end
