# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).on 'ready page:load', ->

  $(".affiliate").click ->
    ga_aff($(this).data('serv'), $(this).data('page'))


  ga_aff = (serv_name, page_type) ->
    ga 'send', 'event',
      eventCategory: 'affiliate link'
      eventAction: serv_name
      eventLabel: page_type
      eventValue: 1

  