class CommentsController < ApplicationController
  respond_to :html, :js

  def create
    
    @comment = current_user.comments.build(comment_params)
    @post = @comment.post
    @new_comment = Comment.new
    @topic = @post.topic
    authorize @comment
    if @comment.save
      flash[:notice] = 'Comment was successfully created.'
    else
      flash[:notice] = 'Error creating comment: #{@comment.errors}'
    end

    respond_with(@comment) do |f|
      f.html { redirect_to [@topic, @post] }
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])

    @comment = @post.comments.find(params[:id])
    authorize @comment

    if @comment.destroy
      flash[:notice] = "Comment was removed."
    else
      flash[:error] = "Comment couldn't be deleted. Try again."
    end

    respond_with(@comment) do |f|
      f.html { redirect_to [@topic, @post]}
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :body, :post_id, :user, :avatar)
  end
end

