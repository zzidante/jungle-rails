class UsersController < ApplicationController

  def show
    @user = User.find params[:id]
  end

  def new
  end

  def login
  end

  def logout
  end

  def create
  end

  private

  def user_params # when you make a new user

  end

end
