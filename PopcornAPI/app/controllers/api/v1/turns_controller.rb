class Api::V1::TurnsController < ApplicationController
  respond_to :json, :html

  def create
    attributes = turn_attributes_merge
    @turn = Turn.create(attributes)
    if @turn.save!
      render json: @turn, serializer: TurnSerializer, status: 201
    end
  end

  def find
    turn = Turn.find(params[:id])
    render json: turn
  end

  private

  def turn_params
    params.require(:data).permit(:type, {
      attributes: [:answer, :answer_type, :is_correct]
    })
  end

  def turn_attributes
    turn_params[:attributes] || {}
  end

  def turn_attributes_merge
    return turn_attributes.merge({
      game_id: params[:data][:relationships][:game][:data][:id],
      player_id: params[:data][:relationships][:player][:data][:id]
    })
  end
end
