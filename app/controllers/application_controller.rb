class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def load_association
    puts('Loaded the association from subdomain')
    @association = ResidenceAssociation.where(subdomain: request.subdomain, approved: true).first
  end

  def authenticate_any!
    if current_member.nil? && current_association_admin.nil? && current_admin.nil?
      redirect_to login_path, notice: 'Login before continuing'
    end
  end

  def current_user
    if current_admin!=nil
      current_admin
    elsif current_association_admin!=nil
      current_association_admin
    elsif current_member!=nil?
      current_member
    else
      nil
    end
  end



  helper_method :current_user

  helper_method :load_association
end
