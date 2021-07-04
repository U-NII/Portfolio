class Public::HomesController < ApplicationController
    def top
        @projects = Project.where(is_active: true).where('expired_at >= ?', Date.current).page(params[:page]).per(8)
    end

end
