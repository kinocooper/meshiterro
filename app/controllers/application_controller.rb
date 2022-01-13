class ApplicationController < ActionController::Base
  #deviseの機能が呼び出される直前に『configure_parmitted_parameters』メソッドを実行
  before_action:configure_parmitted_parameters, if: :devise_controller?

  protected #ストロングパラメータ　private：同じコントローラ内 protected：他のコントローラからの呼び出しもOK

  #受取りを許可するパラメータの変更　nameを受け取れるようにする
  def configure_parmitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
