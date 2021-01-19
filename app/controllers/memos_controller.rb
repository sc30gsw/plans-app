class MemosController < ApplicationController
  before_action :authenticate_user!

  def index
    @memos = Memo.all.order('created_at DESC')
    @user = User.find(params[:id])
    unless current_user.id == @user.id
      redirect_to root_path
    end
  end

  def create
    @memo = Memo.create(memo_params)
    @memo.save
    redirect_to "/memos/user/#{current_user.id}"
    # render json:{ post: post }
  end

  def checked
    memo = Memo.find(params[:id])
    if memo.checked
      memo.update(checked: false)
    else
      memo.update(checked: true)
    end

    item = Memo.find(params[:id])
    render json: {memo: item}
  end

  private

  def memo_params
    params.permit(:content).merge(user_id: current_user.id)
  end
end
