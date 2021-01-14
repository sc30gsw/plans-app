class NotesController < ApplicationController
  before_action :authenticate_user!, except: %i[index order_index show]
  before_action :set_note, only: %i[show edit update destroy favorite]

  def index
    @notes = Note.includes(:user).sort { |a, b| b.favorited_users.count <=> a.favorited_users.count }
  end

  def order_index
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
    @comment = Comment.new
    @comments = @note.comments.includes(:user).order('created_at DESC')
  end

  def edit
    redirect_to note_path(@note.id) unless @note.user_id == current_user.id
  end

  def update
    if @note.update(note_params)
      redirect_to note_path(@note.id)
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @note.user_id
      @note.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def favorite
  end

  private

  def note_params
    params.require(:note).permit(:title, :text, :plan, :image).merge(user_id: current_user.id)
  end

  def set_note
    @note = Note.find(params[:id])
  end
end
