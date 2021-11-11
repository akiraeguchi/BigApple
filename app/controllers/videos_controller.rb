class VideosController < ApplicationController

  def index
    @video = Video.new
    @videos = Video.all
  end

  def show
    @video = Video.find(params[:id])
  end

  def create
    @video = Video.new(video_params)
    url = params[:video][:youtube]
    url = url.last(11)
    @video.youtube = url
    if @video.save
      redirect_to videos_path, notice: "動画が投稿されました"
    else
      @videos = Video.all
      @video = video.new
      render :index
    end
  end

  def edit
    @video = Video.find(params[:id])
  end

  def update
    @video = Video.find(params[:id])
    @video.update(video_params)
    if @video.save
      redirect_to videos_path, notice: "動画が更新されました"
    else
      render :edit
    end
  end

  def destroy
    @video = Video.find(params[:id])
    @video.destroy
    redirect_to videos_path, notice: "動画が削除されました"
  end

  private
  def video_params
    params.require(:video).permit(:title, :body, :youtube)
  end

end
