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

end
