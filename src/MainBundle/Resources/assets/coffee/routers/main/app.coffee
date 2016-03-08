define [
  'marionette'
  'wreqr'
  'apps/main/list/controller'
], (Marionette, wreqr, ListController) ->

  class AppRouter extends Marionette.AppRouter
    appRoutes:
      '': 'list'

  API =
    list: () ->
      new ListController
        region: wreqr.reqres.request 'main_region'

  mainApp = new Marionette.Application

  mainApp.addInitializer ->
    new AppRouter
      controller: API

  mainApp