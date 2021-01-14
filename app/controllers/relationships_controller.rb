class RelationshipsController < ApplicationController
  before_action :set_user, only: [:create, :destroy]

  def create
    following = current_user.follow(@user)
    if following.save
      respond_to do |format|
        format.html {redirect_to user_paht(@user.id)}
        format.js
      end
    else
      redirect_to user_path(@user.id)
    end
  end

  def destroy
    following = current_user.unfollow(@user)
    if following.destroy
      respond_to do |format|
        format.html {redirect_to user_path(@user.id)}
        format.js
      end
    else
      flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
      redirect_to user_path(@user.id)
    end
  end

  def followings
    @user = User.find(params[:id])
    @users = @user.followings.all
  end

  private

  def set_user
    @user = User.find(params[:follow_id])
  end
end
