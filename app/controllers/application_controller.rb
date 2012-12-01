class ApplicationController < ActionController::Base
  protect_from_forgery
  JS_ESCAPE_MAP = {
      '\\'    => '\\\\',
      '</'    => '<\/',
      "\r\n"  => '\n',
      "\n"    => '\n',
      "\r"    => '\n',
      '"'     => "\"",
      "'"     => "\'" }

  def escape_javascript(str)
    return str if str.blank?
    str.gsub!(/(\\|<\/|\r\n|[\n\r"'])/) { JS_ESCAPE_MAP[$1] }
    str
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_path, :alert => exception.message
  end

  private
  def after_sign_in_path_for(resource)
    items_path
  end
  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource)
    root_path
  end
end
