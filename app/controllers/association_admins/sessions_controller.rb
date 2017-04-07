class AssociationAdmins::SessionsController < Devise::SessionsController
# before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  def after_sign_in_path_for(resource)
    if current_association_admin.residence_association!=nil
      residence_association_url(current_association_admin.residence_association, subdomain: current_association_admin.residence_association.subdomain)
    else
      new_residence_association_url(subdomain: 'tmp')
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    root_url(subdomain: '')
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
