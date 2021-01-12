class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]

  def create
    @comment = Comment.new(comment_params)
    if @comment.valid?
      @comment.save
      redirect_to note_path(@comment.note)
    else
      @note = @comment.note
      @comments = @note.comments
      render "notes/show"
    end
  end


  def destroy
    @note = @comment.note
    if @comment.user_id == current_user.id 
      @comment.destroy
      redirect_to note_path(@note.id)
    else
      render 'notes/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :image).merge(user_id: current_user.id, note_id: params[:note_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
