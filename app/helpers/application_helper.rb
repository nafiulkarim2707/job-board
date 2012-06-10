module ApplicationHelper

  def pagination_links(collection, options = {})
    options[:renderer] ||= BootstrapPaginationHelper::LinkRenderer
    options[:class] ||= 'pagination pagination-centered'
    options[:inner_window] ||= 2
    options[:outer_window] ||= 1
    will_paginate(collection, options)
  end

  def job_slug(company_name, job_title)
    (company_name.to_s + ' ' + job_title.to_s).parameterize
  end

  def render_jquery_tabs(items, title_method, &content_proc)
    titles, contents = [], []

    items.each do |item|
      titles << (item.send(title_method) || 'untitled')
      contents << capture { content_proc.call(item) }
    end

    _jqtab_render_html(titles, contents).html_safe
  end

  private
  def _jqtab_render_html(titles, contents)
    content_tag 'div', class: 'tabbable' do
      _tab_ids = []

      # Tab headers
      tabs = content_tag 'ul', class: 'nav nav-tabs' do
        titles.map do |title|
          content_tag 'li' do
            _id = "tab_#{rand(200) * Time.now.to_i}"
            _tab_ids << _id

            content_tag('a', title, href: "##{_id}", 'data-toggle' => "tab").html_safe
          end.html_safe
        end.join('').html_safe
      end

      # Tab panes
      panes = content_tag 'div', class: 'tab-content' do
        i = 0
        contents.map do |content|
          _html = content_tag('div', content, class: 'tab-pane', id: _tab_ids[i]).html_safe
          i += 1
          _html
        end.join('').html_safe
      end

      # Tab scripts
      javascript = content_tag 'script', type: 'text/javascript' do
        %{

        }
      end

      [tabs, panes, javascript].join(' ').html_safe
    end.html_safe
  end


  def link_to_remove_fields(name, f, html_options={})
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)", html_options)
  end

  def link_to_add_fields(name, f, association, html_options={})
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")", html_options)
  end

end
