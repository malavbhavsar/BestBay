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

  def current_wishlist
    if current_user.wishlist.nil?
      current_user.create_wishlist
    else
      current_user.wishlist
    end
  end

end