class GCMServerTest.Views.EntitiesIndex extends Backbone.View

  template: JST['entities/index']

  events:
    'submit #new_entity': 'create_entity'

  initialize: ->
    @collection.on( 'reset', @render, this )
    @collection.on( 'add', @append_entity, this )

  render: ->
    $(@el).html(@template())
    @collection.each(@append_entity)
    this

  append_entity: (entity) ->
    single_entity_view = new GCMServerTest.Views.Entity( model: entity )

  create_entity: (event) ->
    event.preventDefault()
    @collection.create entity_name: '#new_entity_name', 
      entity_email: '#new_entity_email',
      entity_telephone_number: '#new_entity_telephone',
      categories: '#new_entity_categories',
      wait: true
      success: -> alert 'Success'
      error: @on_error

  on_error: (entity, response)->
    if response.status == 422 # 422 es igual a un validation error
      errors = $.parseJSON(response.responseText).errors
      for attribute, messages of errors
        alert "#{attribute} #{message}" for message in messages
        
      
    