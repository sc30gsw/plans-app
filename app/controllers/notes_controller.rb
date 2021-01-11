class NotesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_note, only: [:show, :edit, :update]

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

  def show; end

  def edit 
    unless @note.user_id == current_user.id
      redirect_to note_path(@note.id)
    end
  end

  def update
    if @note.update(note_params)
      redirect_to note_path(@note.id)
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def note_params
    params.require(:note).permit(:title, :text, :plan, :image).merge(user_id: current_user.id)
  end

  def set_note
    @note = Note.find(params[:id])
  end
end
