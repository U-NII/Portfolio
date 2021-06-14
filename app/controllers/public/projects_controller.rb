class Public::ProjectsController < ApplicationController
	def index
      @genres = Genre.all
      @projects = Project.where(sale_status: true).page(params[:page]).per(8)
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
	  parmas.require(:project).permit(:image ,:name, :description, :price, :sale_status)
	end

end
