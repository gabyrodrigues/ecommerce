class ApplicationController < ActionController::Base
    before_action :authenticate_usuario!
    before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
        if Admin.find_by(usuario_id: current_usuario.id)
            session[:papel_id] = "Administrador"
        elsif Cliente.find_by(usuario_id: current_usuario.id)
            session[:papel_id] = "Cliente"
        end

        catalogo_produtos_path
    end

    def after_accept_path_for(resource)
        if Admin.find_by(usuario_id: current_usuario.id)
            session[:papel_id] = "Administrador"
        elsif Cliente.find_by(usuario_id: current_usuario.id)
            session[:papel_id] = "Cliente"
        end

        catalogo_produtos_path
    end

    protected

    def validate_route
        if session[:papel_id] != "Administrador"
            redirect_to private_route_admins_path
        end
    end

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:nome])
        devise_parameter_sanitizer.permit(:account_update, keys: [:nome])
    end
end
