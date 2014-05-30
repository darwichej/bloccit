class CommentsController < ApplicationController
  #def new
  #end

  def create
    
    @comment = current_user.comments.build(comment_params)
    @post = @comment.post
    @topic = @post.topic
    authorize @comment
    if @comment.save
      flash[:notice] = 'Comment was successfully created.'
      redirect_to([@topic, @post])
    else
      flash[:notice] = 'Error creating comment: #{@comment.errors}'
      redirect_to(@comment.post)
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])

    @comment = @post.comments.find(params[:id])

    authorize @comment
    if @comment.destory
      flash[:notice] = "Comment was removed."
      redirect_to [@topic, @post]
    else
      flash[:error] = "Comment couldn't be deleted. Try again."
      redirect_to [@topic, @post]
    end
  end


  def comment_params
    params.require(:comment).permit(:comment, :body, :post_id, :user, :avatar)
  end
end

