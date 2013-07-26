class GCMServerTest.Views.EntitiesIndex extends Backbone.View

  template: JST['entities/index']

  initialize: ->
    @collection.on( 'sync', @render, this )

  render: ->
    $(@el).html(@template( entities: @collection ))
    this
    
