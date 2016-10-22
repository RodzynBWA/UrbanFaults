# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

lbt = '#login_btn'
rbt = '#reg_btn'

efi = '#session_email'
pfi = '#session_password'
eufi = '#user_email'
pufi = '#user_password'

lock_buttons = () ->
  console.log 'lock'
  $(lbt).attr('disabled', true)
  $(rbt).attr('disabled', true)
  add_events(efi, pfi, lbt)
  add_events(pfi, efi, lbt)
  add_events(eufi, pufi, rbt)
  add_events(pufi, eufi, rbt)
  
add_events = (v1, v2, i) ->
  $(v1).keyup () ->
    unlock_event(v1, v2, i)
    return
  $(v1).blur () ->
    unlock_event(v1, v2, i)
    return
  $(v1).on('change', () ->
    unlock_event(v1, v2, i)
    return
  )
  
unlock_event = (v1, v2, o) ->
  if($(v1).val().length != 0 && $(v2).val().length != 0)
    $(o).attr('disabled', false)          
  else
    $(o).attr('disabled',true)
  
$(document).ready lock_buttons