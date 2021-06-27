class Public::ReceivedsController < ApplicationController
  def index
    @received = Received.new
    @receiveds = current_member.receiveds
  end

  def edit
    @received = Received.find(params[:id])
  end

  def create
    @received = Received.new(received_params)
    @received.member_id = current_member.id
    @receiveds = current_member.receiveds
    if @received.save
      redirect_to public_receiveds_path, notice:"新しい配送先を追加しました。"
    else
      render :index
    end
  end

  def update
    @received = Received.find(params[:id])
    if @received.update(received_params)
      redirect_to public_receiveds_path, notice:"配送情報を変更しました。"
    else
      render :edit
    end
  end

  def destroy
     @received = Received.find(params[:id])
    if@received.destroy
      redirect_to public_receiveds_path, notice:"配送先を削除しました。"
    else
      render :index
    end
  end

  private

  def received_params
    params.require(:received).permit(:telephone_number, :name)
  end
  
end
