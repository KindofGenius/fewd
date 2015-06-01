# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('.edit_dish').on 'submit', ->
    dish_id = $(this).data("dish-id")
    $('#editModal_'+ dish_id).modal 'hide'
