# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

lbt = '#login_btn'
efi = '#session_email'
pfi = '#session_password'

unlock_login_button = () ->
  console.log 'Init'
  $(lbt).attr('disabled', true)
  $(efi).keyup () ->
    unlock_event()
    return
  $(pfi).keyup () ->
    unlock_event()
    return
  $(efi).blur () ->
    unlock_event()
    return
  $(pfi).blur () ->
    unlock_event()
    return
  $(efi).on('change', () ->
    unlock_event()
    return
  )
  $(pfi).on('change', () ->
    unlock_event()
    return
  )
  
unlock_event = () ->
  if($(efi).val().length != 0 && $(pfi).val().length != 0)
    $(lbt).attr('disabled', false)          
  else
    $(lbt).attr('disabled',true)
  
$(document).ready unlock_login_button