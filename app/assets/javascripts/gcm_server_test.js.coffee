# window.GCMServerTest =
#   Models: {}
#   Collections: {}
#   Views: {}
#   Routers: {}
#   initialize: ->
#     # new GCMServerTest.Routers.Entities()
#     Backbone.history.start()

# $(document).ready ->
#   GCMServerTest.initialize()
#   $('#entities_view').on 'click': (event) ->
#     entities = new GCMServerTest.Collections.Entities()
#     new GCMServerTest.Routers.Entities( collection: entities )

SmartOut = new Backbone.Marionette.Application()

# =================Models============================
# Entity = Backbone.Model.extend({})
# Entities = Backbone.Collection(
#     model: Entity
#     )
    

# # =================Entity Views=========================
# EntityView = Backbone.Marionette.ItemView.extend(template: "#some-template")

# EmptyView = Backbone.Marionette.ItemView.extend(template: "#some-template")

# FormView = Backbone.Marionette.ItemView.extend(
#     template: JST['entities/new_entity']
#     events:
#         'submit #new_entity': 'create_entity'
#     ui:
#         company_name: '#new_entity_name'
#         email: '#new_entity_email'
#         phone: '#new_entity_telephone'


#     create_entity: (event) ->
#       event.preventDefault()
#       @collection.add(
#             company_name: @ui.company_name.val()
#             email               : @ui.email.val()
#             phone              : @ui.phone.val()
#             )
#       @ui.company_name.val("")
#       @ui.email.val("")
#       @ui.phone.val("")
#       entity = new GCMServerTest.Models.Entity({ entity_name: company_name,\
#         entity_email: email,\
#         entity_telephone_number: phone })
#       entity.save()
#     )

# =================Entity Collections======================
# EntitiesView = Backbone.Marionette.CollectionView.extend( 
#     template: "#some-template"
#     itemView: EntityView
#     )


# =================Regions============================
HeaderView = Backbone.Marionette.ItemView.extend(template: '#header')
ValidationView = Backbone.Marionette.ItemView.extend(template: '#validation')
FooterView = Backbone.Marionette.ItemView.extend(template: "#footer")
MainView = Backbone.Marionette.ItemView.extend(template: "#main")

SmartOut.addRegions(
    form:     "#form"
    header: "#header_region"
    footer:   "#footer_region"
    validation: "#validation_region"
    main: "#main_region"
    )


SmartOut.addInitializer ->
    SmartOut.header.show(new HeaderView())
    SmartOut.footer.show(new FooterView())
    SmartOut.validation.show(new ValidationView())
    SmartOut.main.show(new MainView())


SmartOut.start()