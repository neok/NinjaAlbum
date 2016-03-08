define [
  'config'
  'backbone'
  'marionette'
  'bus'
  'apps/main/app'
], (
  Config
  Backbone
  Marionette
  bus
  MainApp
) ->

  app = new Marionette.Application

  app.addRegions
    headerRegion: ".header"
    mainRegion: ".main-body"

  app.addInitializer ->
    MainApp.start()

  bus.reqres.setHandler 'main_region', ->
    app.mainRegion

  app