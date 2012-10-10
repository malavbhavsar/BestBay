class ApplicationController < ActionController::Base
  protect_from_forgery
  private
  def after_sign_in_path_for(resource)
    items_path
  end
  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource)
    root_path
  end

  def current_wishlist
    if current_user.wishlist.nil?
      current_user.create_wishlist
    else
      current_user.wishlist
    end
  end
end
