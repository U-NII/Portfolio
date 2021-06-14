class Admin::HomesController < ApplicationController
    def top
    end
    
    private
    def if_not_admin
        redirect_to public_root_path unless current_member.admin?
    end
end
