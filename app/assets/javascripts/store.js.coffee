# http://emberjs.com/guides/models/defining-a-store/

SmartOut.Store = DS.Store.extend
  revision: 12
  # adapter: DS.RESTAdapter.create()
  adapter: 'DS.FixtureAdapter'


