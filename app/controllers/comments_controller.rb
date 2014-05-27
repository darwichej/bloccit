class CommentsController < ApplicationController
  #def new
  #end

  def create
    #@post = Post.find(params[:post_id])
    @comment = Comment.new(params[:comment])

    if @comment.save
      flash[:notice] = 'Comment was successfully created.'
      redirect_to(@comment.post)
    else
      flash[:notice] = 'Error creating comment: #{@comment.errors}'
      redirect_to(@comment.post)
    end
  end


  def comment_params
    params.require(:post).permit(:body, :post, :user)
  end
end

