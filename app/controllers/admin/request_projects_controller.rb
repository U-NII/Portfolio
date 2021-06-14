class Admin::RequestProjectsController < ApplicationController
  def update
    @request_projects = RequestProject.find(params[:id])
    @request = @request_projects.order
    if @request_projects.update(request_project_params)
      redirect_to admin_request_path(@request), notice:"制作ステータスを変更しました。"
    else
      render "show"
    end
  end

  private
  def request_project_params
    params.require(:request_projects).permit(:make_status)
  end
end
