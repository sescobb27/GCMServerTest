# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#modify_response = (div) ->
#  $(".wrapper").css
#    width: "50%"
#    margin: "0px auto"
#
#  $(div).removeClass("choose-types").addClass "show-types"
#$(document).ready ->
#
#  $(".choose-types").on "click", ->
#    $.ajax "/types",
#      cache: true
#      success: (result) ->
#        $(".choose-types").html result
#        modify_response ".choose-types"

#  $(".show-types types").children(".type").on "click", (event) ->
#    $.ajax "/types/category_by_type",
#      data:
#        type: event.target.getAttribute("data-name")
#
#      cache: true
#      success: (result) ->
#        $(this).appendChild result