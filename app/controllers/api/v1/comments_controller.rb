class Api::V1::CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    producrt = Product.find_by(id: params[:product_id])
    @comment = producrt.comments.build(commnet_params)
    @comment.user_id = current_user.id

    if @comment.save
      render json: @comment
    end
  end

  private
    def commnet_params
      params.require(:comment).permit(:content)
    end

end
