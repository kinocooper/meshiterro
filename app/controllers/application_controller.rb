class ApplicationController < ActionController::Base

  # deviseのメソッド ログインせず他ページにアクセス⇒ログインページへ遷移。ただしtopページのぞく。
  before_action:authenticate_user!, except:[:top]

  #deviseの機能が呼び出される直前に『configure_parmitted_parameters』メソッドを実行
  before_action:configure_parmitted_parameters, if: :devise_controller?


  #after_sign_in_path_for ...devise独自のメソッド サインイン後の遷移先の指定 初期のroot_pathから変更
  def after_sign_in_path_for(resource)
    post_images_path
  end

  #〃
  def after_sign_out_path_for(resource)
    about_path
  end


  protected #ストロングパラメータ(?)　private：同じコントローラ内 protected：他のコントローラからの呼び出しもOK

  #受取りを許可するパラメータの変更　nameを受け取れるようにする
  def configure_parmitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
