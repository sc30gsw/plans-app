class IntrosController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_intro, only: [:edit, :update]
  before_action :move_to_users, only: [:new, :edit]

  def new
    @intro = Intro.new
  end
  
  def create
    @intro = Intro.new(intro_params)
    if @intro.save
      redirect_to user_path(@intro.user.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @intro.update(intro_params)
      redirect_to user_path(@intro.user.id)
    else
      render :edit
    end
  end

  private

  def set_intro
    @intro = Intro.find(params[:id])
  end

  def intro_params
    params.require(:intro).permit(:first_name, :last_name, :website, :profile, :image).merge(user_id: current_user.id)
  end

  def move_to_users
    unless current_user.id == @intro.user.id
      redirect_to user_path(@intro.user.id)
    end
  end
end

