# For more information see: http://emberjs.com/guides/routing/

App.Router.map () ->
  @resource 'index', { path: '/' }
  @resource 'smartout'
  @resource 'entities'
  

App.EntitiesRoute = Ember.Route.extend
  model: ->
    console.log 'fetching...'
    App.Entity.find()

  # activate: ->
  # deactivate: ->
  # setupController: (controller, model)->
  # renderTemplate: ->
  # beforeModel: ->
  # afterModel: ->

