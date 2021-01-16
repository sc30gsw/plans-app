class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show
    @notes = @user.notes.page(params[:page]).per(5)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
