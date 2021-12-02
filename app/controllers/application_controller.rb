class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
        user_path
    end

    def after_sign_up_path_for(resource)
        user_path
    end

    # ログアウトしたときはnew_user_session_pathに移動。ログイン画面に遷移する
    def after_sign_out_path_for(resource)
        new_user_session_path
    end

    protected
    def configure_permitted_parameters
        # sign_upの時にnameを取ってくる
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
end