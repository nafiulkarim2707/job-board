# Set active top navigation
jQuery ($) ->
  path = window.location.pathname
  path = path[1..path.length]
  path = path.split('/')[0..1].join('-')

  $('#top-menu #' + path).addClass('active')

# Activiate tool tip
jQuery ($) ->
  $('*[title]').tooltip()

# Make data-toggle tab auto togglable
jQuery ($) ->
  $('*[data-toggle="tab"]').click ->
    el = $ @
    target_el = el.attr('href')
    $target_el = $(target_el)

    # Remove existing active state
    $target_el.parent().find('.active').removeClass('active')

    # Mark target tab as active
    $target_el.addClass('active')

    # Remove existing tab selection
    $('a[href="' + target_el + '"]').parent().parent().
      find('li').removeClass('active')

    # Mark target tab header
    tab_links = $('a[href="' + target_el + '"]')
    if tab_links.length > 0
      for link in tab_links
        $link = $(link)
        if $link.parent().parent().hasClass('nav-tabs')
          $link.parent().addClass('active')
