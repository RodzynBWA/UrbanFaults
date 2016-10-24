ban_buttons = ->
  $('.btn_ban').click ->
    ids = this.id
    id = ids.substring(ids.lastIndexOf('_')+1)
    is_ban = ids.substring(0, ids.indexOf('_')) == "ban"
    console.log is_ban + ' '+id
    $.ajax(type: "PUT", url: 'ban', data: {id: id, ban: is_ban} ).done (json) ->
      console.log 'done'
      return
    return
  return
  
$(document).ready ban_buttons