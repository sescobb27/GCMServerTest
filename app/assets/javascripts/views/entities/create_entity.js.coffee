class GCMServerTest.Views.NewEntity extends Backbone.View

  template: JST['entities/new_entity']

  events:
    'submit #new_entity': 'create_entity'

  render: ->
    $(@el).html( @template( ) )
    this

  create_entity: (event) ->
    event.preventDefault()
    alert 'NewEntity'
