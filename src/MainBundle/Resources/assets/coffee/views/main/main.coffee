define [
  'backbone'
  'marionette'
  'text!./main.html'
], (
  Backbone
  Marionette
  templateMain
) ->

  class MainView extends Marionette.ItemView
    template: templateMain