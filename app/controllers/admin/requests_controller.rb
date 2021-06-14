class Admin::RequestsController < ApplicationController
  def index
    @requests = Request.all
    @request_projects = Rquestproject.where(request_id: @requests)
  end

  def show
    @request = Request.find(params[:id])
    @request_projects = Requestproject.where(request_id: @request.id)
  end

  def update
    @request = Request.find(params[:id])
    @request.update(order_params)
    redirect_to request.referer, notice:"注文ステータスを変更しました。"
  end

  private
  def request_params
    params.require(:request).permit(:buy_status)
  end
end
