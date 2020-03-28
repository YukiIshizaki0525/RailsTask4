class ApplicationController < ActionController::Base
  # devise_controllerに関するアクションが実行された際に、
  # configure_permitted_parametersを実行
  before_action :configure_permitted_parameters, if: :devise_controller?

  # ユーザー情報登録する際に、nicknameも登録するメソッド
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
end
