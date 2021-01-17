class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show
    @notes = @user.notes.page(params[:page]).per(5)
    @status_notes = @user.notes.where(created_at: 6.days.ago.beginning_of_day..Time.zone.now.end_of_day)
    @all_count = @status_notes.count
    @favorited_notes = @user.favorited_notes.where(created_at: 6.days.ago.beginning_of_day..Time.zone.now.end_of_day)
    @commented_notes = @user.commented_notes.where(created_at: 6.days.ago.beginning_of_day..Time.zone.now.end_of_day)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
