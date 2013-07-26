class GCMServerTest.Routers.Entities extends Backbone.Router
  routes:
    '': 'index'
    'entities/:id/coupons': 'entities_coupons' # url: #entities/:id/coupons

  index: ->
    index_view = new GCMServerTest.Views.EntitiesIndex();
    $('#container').html(index_view.render().el)

  entities_coupons: (id) ->
    alert 'coupons'