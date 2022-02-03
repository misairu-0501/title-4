class ApplicationController < ActionController::Base

  #devise利用の機能（ユーザ登録、ログイン認証など）が使われる前にconfigure_permitted_parametersメソッドが実行される
  before_action :configure_permitted_parameters, if: :devise_controller?

  #about ページをサインイン後の遷移先に設定
  def after_sign_in_path_for(resource)
    post_images_path
  end

   #about ページをサインアウト後の遷移先に設定
  def after_sign_out_path_for(resource)
    about_path
  end

  #protectedは呼び出された他のコントローラからも参照することができる
  protected

  #configure_permitted_parametersメソッドでは、devise_parameter_sanitizer.permitメソッドを使うことでユーザー登録(sign_up)の際に、ユーザー名(name)のデータ操作を許可している
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
