class PostsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    def index
        @posts = Post.all.order("created_at DESC")
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        @post.user = current_user

        if @post.save
            redirect_to root_path
          else
            render :new
          end
    end

    private
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
