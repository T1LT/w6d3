class UsersController < ApplicationController
  def index
    render plain: "whatever you want - Nishant"
  end

  def create
    render json: params
  end

  def show
    render json: params
  end
end