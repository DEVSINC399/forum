class CommentsController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.build(params[:comment].permit(:comment))
        @comment.user = current_user
        @comment.save
        redirect_to @post, notice: "Record saved successfully."
    end
end
