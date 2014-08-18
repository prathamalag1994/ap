class RegistrationsController < Devise::RegistrationsController 
  def new_admin
    resource = build_resource({})
    respond_with resource
  end


  def create
    build_resource(sign_up_params)

    #create a linked child-class based on polymorphic associations.
    #remember - this type parameter is coming from routes.rb and different signup types happen from different urls
    #puts Admin_class_string.constantize
    child_class = params[:user][:rolable_type].camelize.constantize
    #resource.rolable = child_class.new(params[child_class.to_s.underscore.to_sym])
    resource.rolable = child_class.new(send("#{child_class.to_s.underscore.downcase}_params"))
    
  end

  private
  def admin_params
    params.require(:admin)
  end
end