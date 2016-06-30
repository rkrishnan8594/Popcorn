class Api::V1::UsersController < ApplicationController

  def me
    render json: current_user
  end

  def create
    user = User.create(user_params)
    if user.save
      render json: {user: {email: user.email, username: user.username, password: user.password}}, status: 201
    else
      puts user.errors.messages
      render json: {reason: {error: user.errors.messages}}, status: 419
    end
  end

  def find
    user = User.find(params[:id])
    render json: user
  end

  private
    def user_params
      params.require(:data).require(:attributes).permit(:email, :username, :password, :password_confirmation)
    end
end
