
define [
  'marionette'
  'wreqr'
  'apps/main/controller'
], (Marionette, wreqr, MainController) ->

  app = new Marionette.Application()

  app.on 'start', ->
    new MainController
      region: wreqr.reqres.request 'main_region'

  app