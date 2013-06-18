# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
    $('#companies').click (event) ->
        event.preventDefault()
        $.getJSON '/entities.json', (result) ->
            $('body').append "<div id='entities'> <table id='entities'> <tbody></tbody> </table> </div>"
            table = $('#entities').find 'tbody'
            $.each result, (key,val) ->
                table.append $("<tr class='entity'></tr>").append $("<td id='"+key+"'>"+val['entity_name']+"</td>")
        $('#companies').remove()

