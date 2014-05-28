class CommentsController < ApplicationController
  #def new
  #end

  def create
    
    @comment = current_user.comments.build(comment_params)
    @post = @comment.post
    @topic = @post.topic

    if @comment.save
      flash[:notice] = 'Comment was successfully created.'
      redirect_to([@topic, @post])
    else
      flash[:notice] = 'Error creating comment: #{@comment.errors}'
      redirect_to(@comment.post)
    end
  end


  def comment_params
    params.require(:comment).permit(:comment, :body, :post_id, :user)
  end
end

