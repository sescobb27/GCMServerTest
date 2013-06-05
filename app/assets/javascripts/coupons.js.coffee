# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  read = (file) ->
    reader = new FileReader
    reader.onload = ((theFile) ->
      (e) ->
        image_span = document.createElement('span')
        image_span.innerHTML = ['<img class=\"img\" src=\"', e.target.result,'\" title=\"', escape(theFile.name), '\"/>'].join ''
        $('#img_container').append(image_span)
    )(file)
    reader.readAsDataURL file


  handleFileSelect = (event)->
    files = event.target.files
    read file for file in files
    $('#img_container').css
      display: 'block'


  div = document.getElementById('img_change')
  div.addEventListener('change',handleFileSelect, false)
