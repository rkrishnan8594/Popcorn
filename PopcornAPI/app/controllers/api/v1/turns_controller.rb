class Api::V1::TurnsController < ApplicationController
  respond_to :json, :html

  def index
    turns = Turn.all
    render json: turns
  end

  def create
    turn = Turn.create(turn_params)
    if turn.save
      render json: turn, status: 201
    end
  end

  def show
    turn = Turn.find(params[:id])
    render json: turn
  end

  private

  def turn_params
    params.require(:data).require(:attributes).permit(:type, :answer, :isCorrect)
  end
end
