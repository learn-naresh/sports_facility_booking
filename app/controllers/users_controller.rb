class UsersController < ApplicationController
  include JsonWebToken

  def register
    user = User.new(user_params)
    if user.save!
      token = JsonWebToken.encode(user_id: user.id)
      render json: { userDetails: {
        uid: user.id,
        name: user.name,
        email: user.email,
      }, token: token }, status: :ok
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def login
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: user.id)
      render json: { userDetails: {
        uid: user.id,
        name: user.name,
        email: user.email,
      }, token: token }, status: :ok
    else
      render json: { error: 'Invalid credentials' }, status: :unauthorized
    end
  end

  def show
    user = User.find(params[:id])
    render json: user, status: :ok
  end

  def update
    user = User.new(user_params)
    if user.save
      render json: user, status: :ok
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end
  
  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
