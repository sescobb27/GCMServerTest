class GCMServerTest.Routers.Entities extends Backbone.Router
  routes:
    'entities/': 'index'
    'entities/:id/coupons': 'entities_coupons' # url: #entities/:id/coupons

  initialize: ->
    @collection = new GCMServerTest.Collections.Entities()
    @collection.fetch()

  index: ->
    index_view = new GCMServerTest.Views.EntitiesIndex( collection: @collection )
    $('.container').html(index_view.render().el)

  entities_coupons: (id) ->
    alert 'coupons'