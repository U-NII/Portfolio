class Public::GenresController < ApplicationController
  def index
    @genres = Genre.all
  end

  def show
    @projects = Project.all
    #@project = Project.find(params[:id])
  end

  private
  def genre_params
    params.require(:genre).permit(:name, :is_valid)
  end

end
