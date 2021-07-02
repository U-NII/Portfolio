class Public::RequestsController < ApplicationController
  #efore_action :check_name_and_tel_phone, only: [:request_confirm]

  def index
    @requests = Request.all
  end

  def new
    @request = Request.new
    @addresses = current_member.receiveds
  end

  def show
    @requests = current_member.requests
    @request = Request.find(params[:id])
  end

  def request_confirm
    @cart_projects = current_member.cart_projects
    @addresses = current_member.receiveds
    @sub_total = 0

    @cart_projects.each do |cart|
        @sub_total += cart.project.tax_included_price.floor * cart.quantity
    end

    @request = Request.new
    @request.member_id = current_member.id
    @request.name = current_member.first_name + current_member.last_name
    @request.buy_status = 0
    @request.shipping_cost = 500
    @request.total_price = @sub_total + @request.shipping_cost
    @request.pay_type = params[:request][:pay_type]
    @request.entrys_option = params[:request][:entrys_option]
   if params[:request][:entrys_option] == "1"
    @request.telephone_number = current_member.telephone_number
    @request.name = current_member.last_name + current_member.first_name
   elsif params[:request][:entrys_option] == "2"
    @received = Received.find(params[:request][:address_id])
    @request.telephone_number = received.telephone_number
    @request.name = received.name
   elsif params[:request][:entrys_option] == "3"
    @request.telephone_number = params[:request][:telephone_number]
    @request.name = params[:request][:name]
   end

    #new画面でのバリデーション
   if @request.invalid?
     render :new
   end
  end

  def create
    @request = Request.new(request_params)
    @request.member_id = current_member.id
    @request.total_price = @request.total_price
    @request.shipping_cost = 500
  unless @request.save
    @receiveds = Received.where(member: current_member)
    render :new
  else
    if params[:request][:received] == "1"
      current_member.address.new(request_params)
    end

    # カート商品の情報を注文商品に移動
    @cart_projects = current_member.cart_projects
    @cart_projects.each do |cart_project|
      @request_project = RequestProject.new
      @request_project.project_id = cart_project.project_id
      @request_project.request_id = @request.id
      @request_project.quantity = cart_project.quantity
      @request_project.price = cart_project.project.price
      @request_project.make_status = 0
      if @request_project.save
        requests = Request.all
        total_quantity = 0
        requests.each do |request|
          limid = RequestProject.find_by(request_id: request.id, project_id: cart_project.project_id)
          if limid != nil
            total_quantity += limid.quantity
          end
        end
        project = Project.find(cart_project.project_id)
        if total_quantity >= project.count_limid
          project.is_active = false
          project.save
        end
      end
    end
    if request_params[:entrys_option] == "3"
      @received = Received.new(member: current_member, name: @request.name, telephone_number: @request.telephone_number)
      @received.save!
    end
      @cart_projects.destroy_all
      redirect_to public_complete_path
  end
  end

  def complete
  end

  private

  def request_projects_maker(request)

    cart_project = current_member.cart_projects

    cart_project.each do |cart_project|
      request_projects = RequestProject.new

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
    params.require(:request).permit(:pay_type, :name, :total_price, :telephone_number, :entrys_option )
  end

end
