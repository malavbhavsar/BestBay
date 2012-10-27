module ApplicationHelper
  def flash_class(level)
    case level
      when :success then "success"
      when :info then "info"
      when :notice then "info"
      when :error then "error"
      when :alert then "error"
      when :recaptcha_error then "error"
      else "block"
    end
  end
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def resource_class
    User
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

end