class CommentsController < ApplicationController
  def create
  	@post = Post.find(params[:post_id])
  	@commnet = @post.comments.create(comment_params)

  	flash[:notice] ='comment Added'

  	redirect_to post_path(@post)
  end

  private
 	def comment_params
 		params.require(:comment).permit(:name, :email, :body, :post_id)
  end
end
