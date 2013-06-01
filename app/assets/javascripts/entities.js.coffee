# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#eventos = (section) ->
#  each_type = section.find(".type")
#  each_type.on "click", ->
#    type = $(this).data("name")
#    $(this).append $("<section class='category_type'></section>")
#    $(this).find("category_type").load "/category_type/" + type
#
#$(document).ready ->
#  already_loaded = null
#  $(".choose-types").on "click", ->
#    unless already_loaded?
#      $(this).addClass("show-types").removeClass "choose-types"
#      already_loaded = $(this).load("/types", ->
#        eventos $("show-types")
#      )
#      $(".wrapper").css
#        width: "20%"
#        margin: "0px auto"


add_category = (section) ->
  selection = []
  section.each ->
    $(this).addClass("unselected")
    $(this).on 'click', ->
      selected = $(this)
      selected_category = selected.data("category")
      pos = selection.indexOf(selected_category)
      if pos >= 0
        selection.splice(pos,1)
        selected.removeClass('selected').addClass('unselected')
      else if selection.length >= 3
        #error hacer div de error
        alert 'muchas categorias, maximo 3'
      else
        selection.push selected_category
        selected.removeClass('unselected').addClass('selected')


eventos = (section) ->
  section.each ->
    already_loaded = null
    $(this).on "click", ->
      unless already_loaded?
        height_size = 0
        type = $(this).data("name")
        category_type = $('.wrapper').find(".category_type")
        if category_type.length == 0
          $('.wrapper').append "<section class='category_type'></section>"
          $('.show-types').css
            float: 'left'
          category_type = $('.wrapper').find(".category_type")
        already_loaded = $.ajax("/category_type/"+type,
          cache: true
          success: (result) ->
            category_type.html result
            categories = category_type.find(".category")
            add_category categories
            height_size = categories.size()
            category_type.css
              height: height_size*2.2+"em"
            already_loaded = null
        )


$(document).ready ->
  already_loaded = null
  $(".choose-types").on "click", ->
    unless already_loaded?
      $(this).addClass("show-types").removeClass "choose-types"
      show_type = $(this)
      already_loaded = $.ajax("/types",
        cache: true
        success: (result) ->
          show_type.html result
          eventos show_type.find(".type")
      )