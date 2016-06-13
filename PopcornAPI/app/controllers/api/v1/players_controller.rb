class Api::V1::PlayersController < ApplicationController
  def find
    player = Player.find(params[:id])
    render json: player
  end
end
