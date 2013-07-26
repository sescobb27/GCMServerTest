window.GCMServerTest =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new GCMServerTest.Routers.Entities()
    Backbone.history.start()

$(document).ready ->
  GCMServerTest.initialize()
