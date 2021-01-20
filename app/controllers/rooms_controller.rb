class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room, only: [:show, :destroy]

  def create
    @room = Room.create
    @entry1 = Entry.create(room_id: @room.id, user_id: current_user.id)
    @entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(room_id: @room.id))
    redirect_to "/rooms/#{@room.id}"
  end

  def show
    @messages = @room.messages
    @message = Message.new
    @entries = @room.entries
  end

  def destroy
    if @room.destroy
      redirect_to root_path
    else
      render action: :show
    end
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end
end
