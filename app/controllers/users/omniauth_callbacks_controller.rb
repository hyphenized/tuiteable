class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user
      set_flash_message(:notice, :success, kind: "Facebook")
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      flash[:alert] = "Error creating user with Facebook"
      redirect_to new_user_registration_url
    end
  end
  def github
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user
      set_flash_message(:notice, :success, kind: "Github")
    else
      session["devise.github"] = request.env["omniauth.auth"]
      flash[:alert] = "Error creating user with Github"
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
end