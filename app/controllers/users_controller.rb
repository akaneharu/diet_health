class UsersController < ApplicationController
  def show
    @user = User.find(params[:])
  end

  def edit
  end
end
