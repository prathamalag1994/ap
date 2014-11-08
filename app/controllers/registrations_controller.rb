class RegistrationsController < Devise::RegistrationsController 
  def new_admin
    resource = build_resource({})
    respond_with resource
  end


  def create
    build_resource(sign_up_params)
    
  end

  private
  def admin_params
    params.require(:admin)
  end
end