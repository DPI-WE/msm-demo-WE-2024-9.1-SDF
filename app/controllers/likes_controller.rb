class LikesController < ApplicationController
  def create
    @like = Like.create(like_params)

    respond_to do |format|
      format.html { redirect_to @like.likeable, notice: "Like was successfully created." }
      format.js
    end
  end

  private

  def like_params
    params.require(:like).permit(:likeable_id, :likeable_type)
  end
end
