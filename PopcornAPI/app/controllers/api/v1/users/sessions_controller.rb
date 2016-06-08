class Api::V1::Users::SessionsController < Devise::SessionsController
  respond_to :html, :json

  def create
    super do |user|
      if request.format.json?
        data = {
          token: user.authentication_token,
          email: user.email,
          id: user.id
        }
        render json: data, status: 201 and return
      end
    end
  end
end
