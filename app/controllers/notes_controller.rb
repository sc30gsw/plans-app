class NotesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_note, noly: [:show]

  def index
    @notes = Note.includes(:user).order('created_at DESC')
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

  def show
  end

  private

  def note_params
    params.require(:note).permit(:title, :text, :plan, :image).merge(user_id: current_user.id)
  end

  def set_note
    @note = Note.find(params[:id])
  end
end
