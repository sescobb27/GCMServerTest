# class GCMServerTest.Views.EntitiesIndex extends Backbone.View

#   template: JST['entities/index']

#   events:
#     'click #entity_form': 'new'

#   initialize: ->

#   render: ->
#     $(@el).html(@template())
#     this

#   new: (event) ->
#     event.preventDefault()
#     form_view = new GCMServerTest.Views.NewEntity()
#     $(@el).append( form_view.render().el)
#     @$('#entity_form').remove()