class TagsController < ApplicationController
  def index
    @tags = Tag.joins(:posts).all
    @tags = @tags.sort{|a, b| b.posts.length <=> a.posts.length }
  end

  def show
    @tag = Tag.find(params[:id])
  end
end
