define [
  'config'
  'backbone'
  'marionette'
  'wreqr'
  'apps/main/app'
], (
  Config
  Backbone
  Marionette
  wreqr
  MainApp
) ->

  app = new Marionette.Application

  app.addRegions
    headerRegion: ".header"
    mainRegion: ".main-body"

  app.addInitializer ->
    MainApp.start()

  wreqr.reqres.setHandler 'main_region', ->
    app.mainRegion

  app