# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  read = (file) ->
    reader = new FileReader
    reader.onload = ((theFile) ->
      (event) ->
        preview = $('#img_container').find('.preview')
        if preview.length == 0
            $('#img_container').html "<span class='preview'></span>"
            preview = $('#img_container').find('.preview')
        preview.html ['<img class=\"img\" src=\"', \
                                event.target.result,'\" title=\"', \
                                escape(theFile.name), '\"/>'].join ''
    )(file)
    reader.readAsDataURL file


  handleFileSelect = (event)->
    files = event.target.files
    read file for file in files
    $('#img_container').css
      display: 'block'


  div = document.getElementById('img_change')
  div.addEventListener('change',handleFileSelect, false)
