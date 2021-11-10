class VideosController < ApplicationController

  def index
    @video = Video.new(video_params)
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
      redirect_to video_path(@video.id), notice: "動画が投稿されました"
    else
      @videos = Video.all
      @video = video.new(video_params)
      render :index
    end
  end

  private
  def video_params
    params.permit(:title, :body, :youtube)
  end

end
