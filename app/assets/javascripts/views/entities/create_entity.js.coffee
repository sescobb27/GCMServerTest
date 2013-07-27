class GCMServerTest.Views.NewEntity extends Backbone.View

  template: JST['entities/new_entity']

  events:
    'submit #new_entity': 'create_entity'
    'click #effect': 'display'

  initialize: ->

  render: ->
    $(@el).html( @template( ) )
    @$('.show-types').hide()
    this

  create_entity: (event) ->
    event.preventDefault()
    alert 'NewEntity'

  display: (event) ->
    event.preventDefault()
    @$('.show-types').show( "explode" )

