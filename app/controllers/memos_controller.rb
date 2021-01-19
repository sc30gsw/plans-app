class MemosController < ApplicationController

  def index
    @memos = Memo.all.order('created_at DESC')
  end

  def create
    @memo = Memo.create(memo_params)
    @memo.save
    redirect_to "/memos/user/#{current_user.id}"
    # render json:{ post: post }
  end

  def checked
    memo = Memo.find(parma[:id])
    if memo.checked
      memo.update(checked: false)
    else
      memo.update(checked: true)
    end
  end

  private

  def memo_params
    params.permit(:content).merge(user_id: current_user.id)
  end
end
