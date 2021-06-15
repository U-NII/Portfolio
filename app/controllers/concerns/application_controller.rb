class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
        case resource
        when Admin
            admin_requests_path
        when Member
            public_member_path(current_member)
        end
    end

    def after_sign_out_path_for(resource_or_scope)
        if resource == :member
            public_root_path
        elsif resource_or_scope == :admin
            new_admin_session_path
        else
            root_path
        end
    end

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :telephone_number])
    end

end