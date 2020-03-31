class CommentsController < ApplicationController

    def create
        @post = Post.find(params[:post_id])
        # @comment = Comment.new 
        @comment = @post.comments.new
        @comment.comment = params[:comment]
        @comment.save
        redirect_to post_path(@post)
    end


    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to post_path(@post)

    end

    def edit
        #validation

        #update
        @post = Post.find(params[:id])
        # posts_params = params.permit([:post][:title])
        @comment = @post.comments.find(params[:id])
        @post.update(post_params)

        #redirect
        redirect_to action: :index
        end
    
end