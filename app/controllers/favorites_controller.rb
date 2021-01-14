class FavoritesController < ApplicationController
  def create
    @favorite = current_user.favorites.new(note_id: params[:note_id])
    redirect_to "/notes/#{params[:note_id]}" if @favorite.save
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, note_id: params[:note_id])
    redirect_to "/notes/#{params[:note_id]}" if @favorite.destroy
  end

  def user
    @user = User.find(params[:id])
  end
end
