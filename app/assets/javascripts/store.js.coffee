# http://emberjs.com/guides/models/defining-a-store/

App.Store = DS.Store.extend
  revision: 12
  # adapter: DS.RESTAdapter
  # adapter: DS.RESTAdapter.create()
  # adapter: 'DS.FixtureAdapter'
DS.RESTAdapter.configure("plurals", {
  entity: "entities"
});