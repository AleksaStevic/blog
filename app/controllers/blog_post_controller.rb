class BlogPostController < ApplicationController
  def index
    @blog_posts = BlogPost.all
  end

  def show
    @post = BlogPost.find(params[:id])
  end
end
