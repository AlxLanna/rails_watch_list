require 'pry'

class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    list = List.find(params[:list_id])
    @bookmark.list = list
    movie = Movie.find_by(id:params[:bookmark][:movie_id])
    @bookmark.movie = movie

    if @bookmark.save
      redirect_to list, notice: 'Bookmark was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    redirect_to list_path(@bookmark.list), status: :see_other
  end


  private

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end

end


# params[:id]
