class UsersController < ApplicationController

  def show
    @user = User.find params[:id]
  end

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/users/new'
    end
  end

  def login
  end

  def logout
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name, :last_name, :email, :password, :password_confirmation
      )
  end

end
