class BlogsController < ApplicationController

  

  def index
    @articles = Article.all.order("id DESC")
  end
  
  def new
  end
  
  def create
    Article.create(title: blog_params[:title], image: blog_params[:image], content: blog_params[:content], user_id: current_user.id)
  end
  
  def destroy
    article = Article.find(params[:id])
    article.destroy if article.use_id == current_user.id
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    article = Article.find(params[:id])
    article.update(blog_params) if article.user_id == current_user.id
  end
  
  private
  def blog_params
      params.permit(:title, :image, :content)
  end

end

