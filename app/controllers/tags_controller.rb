class TagsController < ApplicationController

  def note
    @tag = Tag.find(params[:id])
  end
end
