class NotesController < ApplicationController

  def index
    @notes = Note.all.order(id: 'DESC')
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    if @note.valid?
      @note.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def note_params
    params.require(:note).permit(:title, :text, :plan).merge(user_id: current_user.id)
  end
end
