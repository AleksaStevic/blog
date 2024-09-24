class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post!
  before_action :set_comment!, only: %i[destroy update edit]
  before_action :authorize_user!, only: %i[destroy update]

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "Comment was successfully created."
    else
      flash[:new_comment_errors] = @comment.errors.full_messages
    end
    redirect_to post_path(@post)
  end

  def destroy
    begin
      @comment.destroy!
    rescue ActiveRecord::RecordNotDestroyed => error
      puts "errors that prevented destruction: #{error.record.errors}"
    end

    respond_to do |format|
      format.html { redirect_to post_path(@post), notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def edit
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(@comment, partial: "posts/comments/edit-form", locals: {comment: @comment})
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(
            @comment,
            partial: "posts/comments/comment",
            locals: {
              comment: @comment,
              notice: "Comment successfully updated."
            }
          )
        end
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(
            @comment,
            partial: "posts/comments/edit-form",
            locals: {
              comment: @comment,
              alert: "There was an error updating comment."
            }
          )
        end
      end
    end
  end

  private

  def set_post!
    @post = Post.find(params[:post_id])
  end

  def set_comment!
    @comment = Comment.find(params[:id])
  end

  def authorize_user!
    redirect_to posts_path, notice: "You don't have a permission to do this" unless current_user == @comment.user
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
