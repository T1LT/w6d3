class UsersController < ApplicationController
  def index
    # render plain: "whatever you want - Nishant"
    if params.has_key?(:query)
      query_string = '%' + params[:query] + '%'
      users = User.where("username like (?)", query_string)
    else
      users = User.all
    end
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
    if user.update(user_params)
      render json: user
    else
      render json: user.errors.full_messages, status: 422
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    if user.destroy
      redirect_to users_url
    else
      render json: user.errors.full_messages, status: 422
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :query)
  end
end