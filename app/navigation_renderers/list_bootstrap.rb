class ListBootstrap < SimpleNavigation::Renderer::Base
  def render(item_container)
    list = item_container.items.inject([]) do |list, item|
      if item.html_options[:opts]
        if item.html_options[:opts][:nav_header]
          list << li_header(item)
        elsif item.html_options[:opts][:icon]
          list << li_icon(item)
        end
      else
        list << li_tag(item)
      end
    end
    list.join.html_safe
  end

  private

  def li_tag(item)
    classes = item.selected? ? 'active' : nil
    content_tag(:li, link_to(item.name, item.url, {:method => item.method}.merge(item.html_options.except(:class,:id,:opts))), { class: classes })
  end

  def li_header(item)
    content_tag(:li, item.name, { class: 'nav-header' }.merge(item.html_options.except(:class,:id,:opts)))
  end

  def li_icon(item)
    classes = item.selected? ? 'active' : nil
    content_tag(:li, content_tag(:a, content_tag(:i, nil, :class => item.html_options[:opts][:icon]) + item.name, {:href => item.url, :method => item.method}.merge(item.html_options.except(:class,:id,:opts))), { class: classes })
  end
end