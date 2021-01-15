class RelationshipsController < ApplicationController
  before_action :set_user, only: [:create, :destroy]
  before_action :follow_user, only: [:followings, :followers]

  def create
    following = current_user.follow(@user)
    if following.save
      redirect_to user_path(@user.id)
    else
      redirect_to user_path(@user.id)
    end
    # フォロー通知作成
    @user.create_notification_follow!(current_user)
  end

  def destroy
    following = current_user.unfollow(@user)
    if following.destroy
      redirect_to user_path(@user.id)
    else
      flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
      redirect_to user_path(@user.id)
    end
  end

  def followings
    @users = @user.followings.all
  end

  def followers
    @users = @user.followers.all
  end

  private

  def set_user
    @user = User.find(params[:follow_id])
  end

  def follow_user
    @user = User.find(params[:id])
  end
end
