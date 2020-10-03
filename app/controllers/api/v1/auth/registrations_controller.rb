class Api::V1::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  private

  def sign_up_params
    params.permit(:email, :password, :password_confirmation, :name, :sex, :image )
  end

  def account_update_params
    params.permit(:name, :email, :sex, :birthday, :push_token, :zipcode, :registered, :phone_number)
  end
end
