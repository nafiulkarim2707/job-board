jQuery ->
  tinyMCE.init
      mode: 'specific_textareas'
      theme: 'advanced'
      editor_selector : "rich-editor"
      theme_advanced_resizing: true
      theme_advanced_toolbar_location: "top"
      theme_advanced_toolbar_align: "left"
      theme_advanced_statusbar_location: "bottom"
      plugins: "autolink,lists,spellchecker,advlink,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template"

  $('#job_tags').tagsInput
    width: '90%',
    height: '40px'
