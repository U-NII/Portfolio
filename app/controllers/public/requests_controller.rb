class Public::RequestsController < ApplicationController
  def index
    @requests = current_member.repuests
  end

  def new
    @request = Request.new
    #@addresses = current_member.addresses
  end

  def show
    @requests = current_member.requests
    @request = Request.find(params[:id])
  end

  def confirm
    @cart_project = current_member.cart_projects
    @sub_total = 0

    @cart_projects.each do |cart|
        @sub_total += cart.project.tax_included_price.floor * cart.quantity
    end

    @request = Request.new
    @request.member_id = current_member.id
    @request.buy_status = 0
    @request.shipping_cost = 800
    @request.pay_type = params[:request][:pay_type]

    #@request_address = params[:request][:address_option]

    #if @request_address == "1"

     #@request.postcode = current_member.postcode
     #@order.address = current_customer.address
     #@order.name = current_customer.last_name + current_customer.first_name

    #elsif @order_address == "2"

     #@address = Address.find(params[:order][:address_id])
     #@order.postcode =  @address.postcode
     #@order.address =  @address.address
     # @order.name = @address.name

    #elsif @order_address == "3"

     #@order.postcode = params[:order][:postcode]
     #@order.address = params[:order][:address]
     #@order.name = params[:order][:name]

    #カスタマーの住所登録と入力内容の確認
     #@address = current_customer.addresses.new
     #@address.postcode = params[:order][:postcode]
     #@address.address = params[:order][:address]
     #@address.name = params[:order][:name]
      #if @address.save
        #flash[:notice] = "新しい住所が登録されました"
      #else
        #flash[:alert] = "正しい住所を入力してください"
        #redirect_back(fallback_location: root_path)
      #end
    #end
  end

  def create
    @request = Request.new(request_params)
    @request.member_id = current_member.id
    @request.total_price = @request.cal_price(current_member)
    @order.shipping_cost = 800
    @order.save

    request_details_maker(@request)

    redirect_to complete_request_path
  end

  def complete
  end

  private

  def request_projects_maker(request)

    cart_project = current_member.cart_request

    cart_project.each do |cart_project|
      request_projects = RquestProject.new

      request_projects.project_id = cart_project.request_id
      request_projects.request_id = request.id
      request_projects.quantity = cart_project.quantity
      request_projects.make_status = 0
      request_projects.price = cart_project.project.price
      request_projects.save
    end

    request_projects.destroy_all

  end

  def request_params
    params.require(:request).permit(:pay_type, :name, :total_price )
  end

end
