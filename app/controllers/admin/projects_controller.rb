class Admin::ProjectsController < ApplicationController
  before_action :set_genres, only: [:new, :edit, :index, :create, :update]
  before_action :authenticate_admin!

  def new
    @project = Project.new
    @genres = Genre.all
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:notice] = "新商品を登録しました"
      redirect_to admin_project_path(@project)
    else
      render :new
    end
  end

  def index
    @project = Project.all.page(params[:page]).per(10)
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
    @genres = Genre.all
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      flash[:success] = "商品内容をを変更しました"
      redirect_to admin_project_path(@product)
    else
      render :edit
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :image, :description,
       :genre_id, :price, :sale_status)
  end

  def set_genres
    @genres = Genre.where(is_valid: true)
  end
end