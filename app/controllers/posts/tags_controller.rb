class Posts::TagsController < ApplicationController
  def index
  end

  def remove
    tag = Tag.find(params[:id])
    render turbo_stream: turbo_stream.remove("tag_#{tag.id}")
  end
end
