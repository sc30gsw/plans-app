class CommentsController < ApplicationController

  def create
  end

  private

  def comment_params
    params.require(:cooment).permit(:text, :image).merge(user_id: current_user.id, note_id: params[:note_id])
  end
end
