class RegistrationsController < Devise::RegistrationsController

  def create
  	build_resource(sign_up_params)
  	resource.role_ids = sign_up_params[:role_ids]
  	super
  end
  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role_ids=>[])
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password)
  end
end