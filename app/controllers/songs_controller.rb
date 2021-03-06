class SongsController < ApplicationController

  def index
    @songs = Song.all
    render :index
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to song_path(@song)
    else
      flash[:error] = []
      flash[:error] = @song.errors.full_messages
      render :new
    end
  end

  def show
    @song = Song.find(params[:id])
    render :show
  end

  def new
    @song = Song.new
    render :new
  end

  def edit
    @song = Song.find(params[:id])
    render :edit
  end

  def update
    @song = Song.find(params[:id])
    if @song.update(song_params)
      redirect_to song_path(@song)
    else
      flash[:error] = []
      flash[:error] = @song.errors.full_messages
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end
end
