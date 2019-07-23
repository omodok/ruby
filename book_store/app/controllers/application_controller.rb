class ApplicationController < ActionController::Base
  #deviseへのカラム追加開始↓
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [
        :shimei, :jusyo, :denwa, :seibetu, :nenrei
      ])
      devise_parameter_sanitizer.permit(:account_update, keys: [
        :admin, :shimei, :jusyo, :denwa, :seibetu, :nenrei
      ])
    end
  #deviseへのカラム追加開始

  #CanCanCanによる権限チェック。モデルと連携してないCは:classをfalseに。
  authorize_resource :class => false
  #can以外のページへアクセスした場合の処理
  rescue_from CanCan::AccessDenied do |exception|
    #リダイレクト先の設定。
    redirect_to (root_url), notice: '管理者以外アクセスできません。'
  end
end
