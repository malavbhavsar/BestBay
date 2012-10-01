module ApplicationHelper
  def flash_class(level)
    case level
      when :success then "success"
      when :info then "info"
      when :notice then "info"
      when :error then "error"
      when :alert then "info"
      else "block"
    end
  end
end