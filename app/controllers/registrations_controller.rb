# app/controllers/registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def after_update_path_for(resource)
    user_path(resource)
  end

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :cpf, :provider, :uid)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :nickname,:cpf,:email, :password, :password_confirmation,
                                 :current_password,:avatar,:cover_photo,:job_title,:bio,:rg, :consignor_organ, :company,
                                 :phone, :celphone, :schooling, :birth_date, :gender, :marital_status, :place_of_birth, :father,
                                 :mother, :address, :neighborhood, :uf, :zip_code, :special_needs, :complement,:need_certificate,:digital_certificate,:printed_certificate,
                                 social_networks_attributes: [:id, :link,:user_id,:social_network_type_id, :_destroy])
  end

end
