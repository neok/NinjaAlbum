define [
  'marionette'
  'syphon'
  'wreqr'
  'views/main/list'
  'views/main/main'
  'repo'
], (
  Marionette
  Syphon
  wreqr
  ListView
  MainView
) ->

  class ListController extends Marionette.Controller

    constructor: (options = {}) ->
      @region = options.region
      super options

    close: (args...) ->
      delete @region
      delete @options
      super args

    show: (view) ->
      @listenTo view, 'close', @close
      @region.show view