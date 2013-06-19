# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
likes = []
add_entity = (td_entity) ->
    td_entity.on 'click', ->
        selected_entity = $(this).text()
        pos = likes.indexOf selected_entity
        if pos >= 0
            likes.splice(pos,1)
            $(this).parent('tr').removeClass('selected').addClass('unselected')
        else
            likes.push selected_entity
            $(this).parent('tr').removeClass('unselected').addClass('selected')

$(document).ready ->
    $('#companies').click (event) ->
        event.preventDefault()
        $.getJSON '/entities.json', (result) ->
            $('body').append "<div> <table id='entities'> <tbody></tbody> </table> </div>"
            table = $('#entities').find 'tbody'
            $.each result, (key,val) ->
                table.append $("<tr class='entity unselected'></tr>").append $("<td id='"+key+"'>"+val['entity_name']+"</td>")
            $('#entities tr').each ->
                $(this).find('td').each ->
                    add_entity $(this)
        $('#companies').remove()
    $('#new_user').submit ->
        if likes.length == 0
            alert('You must select at least one company')
            return false
        else
            $(this).find('#user_entities').val JSON.stringify likes