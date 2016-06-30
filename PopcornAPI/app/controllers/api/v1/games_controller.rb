class Api::V1::GamesController < ApplicationController
  respond_to :json, :html

  def index
    games = Game.all
    render json: games
  end

  def create
    game = Game.create(game_params)
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
