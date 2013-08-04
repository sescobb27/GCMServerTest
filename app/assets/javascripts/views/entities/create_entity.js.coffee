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
    company_name = @$('#new_entity_name').val()
    email = @$('#new_entity_email').val()
    phone = @$('#new_entity_telephone').val()
    entity = new GCMServerTest.Models.Entity({ entity_name: company_name,\
      entity_email: email,\
      entity_telephone_number: phone })
    entity.save()

  display: (event) ->
    event.preventDefault()
    @$('.show-types').show( "explode" )

