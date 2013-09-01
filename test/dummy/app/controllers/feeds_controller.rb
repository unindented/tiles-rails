class FeedsController < ApplicationController
  respond_to :tile

  def show
    @posts = Post.limit(3).order(:title)
    respond_with @posts
  end

end
