class CommentsController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.build(params[:comment].permit(:comment))
        @comment.user = current_user
        @comment.save
        redirect_to @post, notice: "Record saved successfully."
    end

    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to @post
    end
end
