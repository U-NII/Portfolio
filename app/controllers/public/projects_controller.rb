class Public::ProjectsController < ApplicationController
    def index
        @projects = Project.page(params[:page])
        @projects_all = Project.all
        @genre = Genre.find(params[:id]) if params[:id]
        @genres = Genre.all
    end
    
    def show
        @project = Project.find(params[:id])
        @cart_product = Cartproduct.new
    end
end
