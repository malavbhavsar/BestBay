# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  # Specify a custom renderer if needed.
  # The default renderer is SimpleNavigation::Renderer::List which renders HTML lists.
  # The renderer can also be specified as option in the render_navigation call.
  # navigation.renderer = Your::Custom::Renderer

  # Specify the class that will be applied to active navigation items. Defaults to 'selected'
  # navigation.selected_class = 'your_selected_class'

  # Specify the class that will be applied to the current leaf of
  # active navigation items. Defaults to 'simple-navigation-active-leaf'
  # navigation.active_leaf_class = 'your_active_leaf_class'

  # Item keys are normally added to list items as id.
  # This setting turns that off
  # navigation.autogenerate_item_ids = false

  # You can override the default logic that is used to autogenerate the item ids.
  # To do this, define a Proc which takes the key of the current item as argument.
  # The example below would add a prefix to each key.
  # navigation.id_generator = Proc.new {|key| "my-prefix-#{key}"}

  # If you need to add custom html around item names, you can define a proc that will be called with the name you pass in to the navigation.
  # The example below shows how to wrap items spans.
  # navigation.name_generator = Proc.new {|name| "<span>#{name}</span>"}

  # The auto highlight feature is turned on by default.
  # This turns it off globally (for the whole plugin)
  # navigation.auto_highlight = false

  # Define the primary navigation
  navigation.items do |primary|
    # Add an item to the primary navigation. The following params apply:
    # key - a symbol which uniquely defines your navigation item in the scope of the primary_navigation
    # name - will be displayed in the rendered navigation. This can also be a call to your I18n-framework.
    # url - the address that the generated item links to. You can also use url_helpers (named routes, restful routes helper, url_for etc.)
    # options - can be used to specify attributes that will be included in the rendered navigation item (e.g. id, class etc.)
    #           some special options that can be set:
    #           :if - Specifies a proc to call to determine if the item should
    #                 be rendered (e.g. <tt>:if => Proc.new { current_user.admin? }</tt>). The
    #                 proc should evaluate to a true or false value and is evaluated in the context of the view.
    #           :unless - Specifies a proc to call to determine if the item should not
    #                     be rendered (e.g. <tt>:unless => Proc.new { current_user.admin? }</tt>). The
    #                     proc should evaluate to a true or false value and is evaluated in the context of the view.
    #           :method - Specifies the http-method for the generated link - default is :get.
    #           :highlights_on - if autohighlighting is turned off and/or you want to explicitly specify
    #                            when the item should be highlighted, you can set a regexp which is matched
    #                            against the current URI.  You may also use a proc, or the symbol <tt>:subpath</tt>. 
    #
    #<% grouped_options = {"Book"=>["Cookbook","Fairy tale","Novel"],"Cloth"=>["Baby", "Man", "Woman"],
    #                      "Electronic"=>["Laptop", "Mobile phone", "Monitor"],"Home"=>["Kitchen", "Sofa",
    #                                                                                   "Tool kit"],
    #                      "Shoe"=>["Child", "Man", "Woman"]} %>
    navigation.items do |primary|
      primary.item :book, 'Book', items_category_path(["Cookbook", "Fairy tale", "Novel"]) do |book|
        book.item :cookbook, "Cookbook", items_category_path("Cookbook")
        book.item :fairy_tale, "Fairy tale", items_category_path("Fairy tale")
        book.item :novel, "Novel", items_category_path("Novel")
      end
      primary.item :cloth, 'Cloth', items_category_path(["Baby","Man","Woman"]) do |cloth|
        cloth.item :baby, "Baby", items_category_path("Baby")
        cloth.item :man, "Man", items_category_path("Man")
        cloth.item :woman, "Woman", items_category_path("Woman")
      end
      primary.item :electronic, 'Electronic', items_category_path(["Laptop","Mobile phone","Monitor"]) do |electronic|
        electronic.item :laptop, "Laptop", items_category_path("Laptop")
        electronic.item :mobile_phone, "Mobile phone", items_category_path("Mobile phone")
        electronic.item :monitor, "Monitor", items_category_path("Monitor")
      end
      primary.item :home, 'Home', items_category_path(["Tool kit", "Kitchen", "Sofa"]) do |home|
        home.item :tool_kit, "Tool kit", items_category_path("Tool kit")
        home.item :kitchen, "Kitchen", items_category_path("Kitchen")
        home.item :sofa, "Sofa", items_category_path("Sofa")
      end
      primary.item :shoe, 'Shoe', items_category_path(["Child","Sport","Formal"]) do |shoe|
        shoe.item :child, "Child", items_category_path("Child")
        shoe.item :man, "Man", items_category_path("Sport")
        shoe.item :woman, "Woman", items_category_path("Formal")
      end
    end

    # You can also specify a condition-proc that needs to be fullfilled to display an item.
    # Conditions are part of the options. They are evaluated in the context of the views,
    # thus you can use all the methods and vars you have available in the views.

    # you can also specify a css id or class to attach to this particular level
    # works for all levels of the menu
    # primary.dom_id = 'menu-id'
    # primary.dom_class = 'menu-class'

    # You can turn off auto highlighting for a specific level
    # primary.auto_highlight = false

  end

end

SimpleNavigation.register_renderer :list_renderer => ListBootstrap
