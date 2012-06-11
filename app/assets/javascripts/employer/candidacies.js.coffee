jQuery ->
  $('a.resume_link').colorbox
    href: $(this).attr('href')
    width: '90%'
    height: '95%'
    opacity: 0.5

