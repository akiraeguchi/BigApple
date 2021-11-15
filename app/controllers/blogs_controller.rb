class BlogsController < ApplicationController

  def index
    @blog = Blog.new
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to blog_path(@blog.id), notice: "日記が投稿されました"
    else
      @blogs = Blog.all
      render :index
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    @blog.update(blog_params)
    if @blog.save
      redirect_to blog_path(@blog.id), notice: "日記が更新されました"
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :body, :name)
  end

end
