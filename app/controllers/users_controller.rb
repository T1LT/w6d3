class UsersController < ApplicationController
  def index
    # render plain: "whatever you want - Nishant"
    users = User.all 
    render json: users
  end

  def create
    # render json: params
    new_user = User.new(user_params)
    if new_user.save
      render json: new_user
    else
      render json: new_user.errors.full_messages, status: 422
    end
  end

  def show
    user = User.find_by(id: params[:id]) 
    render json: user
  end

  def update
    user = User.find_by(id: params[:id])
    user.update(user_params)
    render json: user
  end

  def destroy
    user = User.find_by(id: params[:id])
    user.delete
    redirect_to users_url
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end