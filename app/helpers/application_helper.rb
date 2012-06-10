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

end
