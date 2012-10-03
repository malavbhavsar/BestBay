module DeviseHelper
  def devise_error_messages!
    return "" if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t("alert.error",
                      :count => resource.errors.count,
                      :resource => resource.class.model_name.human.downcase)

    html = <<-HTML
      <h1>Our error</h1>
      <h3>#{sentence}</h3>
      <ul>#{messages}</ul>
    HTML

    html.html_safe
  end
end