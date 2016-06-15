class Api::V1::SessionsController < Devise::SessionsController
  respond_to :html, :json

  def create
    super do |user|
      if request.format.json?
        data = {
          token: user.authentication_token,
          email: user.email,
          username: user.username,
          id: user.id
        }
        render json: data, status: 201 and return
      end
    end
  end
end
