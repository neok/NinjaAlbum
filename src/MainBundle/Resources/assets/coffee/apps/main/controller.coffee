
define [
  'marionette'
  'views/main/main'
], (Marionette, MainView) ->

  class MainController extends Marionette.Controller

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

    initialize: ->
      MainView = @getMainView()
      @show MainView

    getMainView: ->
      new MainView