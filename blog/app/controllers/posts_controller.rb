class PostsController < ApplicationController
    # layout 'admin' #make the layout(like base in django) for all the methods
    def index
        # render layout: 'my_lay_out'   only //for index method
        # render "controller_name/view_name" //for changing the default naming convention page to be displayed for the views pages
        @posts = Post.order(updated_at: :desc)
    end
    
    def new
        @post = Post.new
    end
    
    def create 
        # @post = Post.new
        # @post.title = params[:title]
        # @post.content = params[:content]
        # @post.save
        
        # or use => redirect_to action :index ,controller: :users
        posts_params = params.permit(:title, :content) #to create a white list
        @post = Post.create(post_params)

        # @post.save
        # @post = Post.create(posts_params)
        # or we can use instead of Post.new(params) we can use Post.create(params)

        redirect_to :posts 
    end


    def edit
        @post = Post.find(params[:id])
    end


    def show
        @post = Post.find(params[:id])
    end

    def update
        #validation

        #update
        @post = Post.find(params[:id])
        # posts_params = params.permit([:post][:title])
        @posts_params = params.permit(post_params)
        @post.update(post_params)

        #redirect
        redirect_to action: :index
        end
    
    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to :posts
    end

    private
    def post_params
        params.require(:post).permit(:title, :content)
    end


end
