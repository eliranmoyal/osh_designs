module ApplicationHelper

	def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def resource_class
  	resource.class
  end

  def flash_key_to_alert(key)
    if key=="notice"
    result = "info" 
    elsif key=="alert"
      result = "error"
    else
      result = key
    end
      result
  end
end
