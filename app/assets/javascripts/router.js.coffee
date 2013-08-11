# For more information see: http://emberjs.com/guides/routing/

SmartOut.Router.map () ->
  @resource('index', { path: '/' })
  @resource('entities')

SmartOut.EntitiesRoute = Ember.Route.extend
  # activate: ->
  # deactivate: ->
  # setupController: (controller, model)->
  # renderTemplate: ->
  # beforeModel: ->
  # afterModel: ->

  model: ->
    SmartOut.Entity.find()

