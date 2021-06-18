class Public::CartProjectsController < ApplicationController
      before_action :authenticate_member!
  def index
    @cart_projects = CartProject.all
    @total_price = @cart_projects.sum{|cart_project|cart_project.project.price * cart_project.quantity * 1.10}
  end

# 商品一覧画面から、「商品購入」を押した時のアクション
  def create
    @project = Project.find(params[:cart_project][:project_id])
    @cart_project = CartProject.new(cart_project_params)
    @cart_project.member_id = current_member.id
    @cart_projects = current_member.cart_projects.all
    @cart_projects.each do |cart_project|
    if cart_project.project_id == @cart_project.project_id
      new_quantity = cart_project.quantity + @cart_project.quantity
      cart_project.update_attribute(:quantity, new_quantity)
      @cart_project.delete
    end
  end
    if @cart_project.save
      redirect_to public_cart_projects_path
    else
      redirect_to request.referer
    end
  end

# カート詳細画面から、「更新」を押した時のアクション
  def update
    @cart_project = CartProject.find(params[:id])
    @cart_project.update(quantity: params[:cart_project][:quantity].to_i)
    redirect_to public_cart_projects_path
  end

# カート詳細画面から、「削除」を押した時のアクション
  def destroy
    @cart_project = CartProject.find(params[:id])
    @cart_project.destroy
    redirect_to public_cart_projects_path
  end

  def all_destroy
    @cart_projects = CartProject.all
    @cart_projects.destroy_all
    redirect_to public_projects_path
  end

  private

  def cart_project_params
    params.require(:cart_project).permit(:project_id,:member_id,:quantity)
  end
end
