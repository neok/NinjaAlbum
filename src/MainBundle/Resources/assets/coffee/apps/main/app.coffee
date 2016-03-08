
define [
  'marionette'
  'bus'
  'apps/main/controller'
], (Marionette, Bus, MainController) ->

  app = new Marionette.Application()

  app.on 'start', ->
    new MainController
      region: Bus.reqres.request 'main_region'

  app