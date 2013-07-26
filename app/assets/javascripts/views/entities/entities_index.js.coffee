class GCMServerTest.Views.EntitiesIndex extends Backbone.View

  template: JST['entities/index']

  render: ->
    $(@el).html(@template())
    this
    
