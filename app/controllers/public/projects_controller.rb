class Public::ProjectsController < ApplicationController
	def index
      @genres = Genre.all
      @projects = Project.where(is_active: true).page(params[:page]).per(8)
    #   @projects = Project.all
	end

	def show
    @projects = Project.all
    @project = Project.find(params[:id])
    @cart_project = CartProject.new
	end

  def about
  end

	private
	def product_params
	  parmas.require(:project).permit(:image ,:name, :description, :price, :is_active)
	end

end
