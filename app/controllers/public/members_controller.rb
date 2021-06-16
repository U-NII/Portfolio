class Public::MembersController < ApplicationController

  def show
    @member = Member.find(params[:id])
  end

  def hide
    @member = current_member
    @member.update(withdrawal_flag: true)
    reset_session
    redirect_to top_path, notice: "またのご利用をお待ちしております。"
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      redirect_to public_member_path(@member.id), notice:"登録情報を変更しました。"
    else
      render :edit
    end
  end

  private
  def member_params
    params.require(:member).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :phone_number)
  end
    
    
end
