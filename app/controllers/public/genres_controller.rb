class Public::GenresController < ApplicationController
  def index
    @genres = Genre.all
  end

  def show
    @genre = Genre.find_by(id: params[:id])
    @projects = @genre.projects
  end

  private
  def genre_params
    params.require(:genre).permit(:name, :is_valid)
  end

end
