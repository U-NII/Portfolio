class Admin::RequestsController < ApplicationController
  def index
    @requests = Request.all
    @request_projects = RequestProject.where(request_id: @requests)
  end

  def show
    @request = Request.find(params[:id])
    @request_projects = RequestProject.where(request_id: @request.id)
    @sub_total = 0
  end

  def update
    @request = Request.find(params[:id])
    @request.update(request_params)
    redirect_to request.referer, notice:"注文ステータスを変更しました。"
  end

  private
  def request_params
    params.require(:request).permit(:buy_status)
  end
end
