class FavoritesController < ApplicationController

  def create
    @favorite = current_user.favorites.new(note_id: params[:note_id])
    if @favorite.save
      redirect_to "/notes/#{params[:note_id]}"
    end
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, note_id: params[:note_id])
    if @favorite.destroy
      redirect_to "/notes/#{params[:note_id]}"
    end
  end
end
