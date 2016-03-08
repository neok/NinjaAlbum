define [
  'marionette'
  'text!templates/main/main.html'
], (Marionette, Template) ->

  class MainView extends Marionette.Layout
    template: Template