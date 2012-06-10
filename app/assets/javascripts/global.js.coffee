(($) ->
  window.remove_fields = (link) ->
    $(link).prev("input[type=hidden]").val "1"
    $(link).closest(".fields").hide()

  window.add_fields = (link, association, content) ->
    new_id = new Date().getTime()
    regexp = new RegExp("new_" + association, "g")
    $(link).parent().before content.replace(regexp, new_id)
)(jQuery)