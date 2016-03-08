define [
  'backbone'
  'marionette'
  'text!templates/main/main.html'
], (
  Backbone
  Marionette
  templateMain
) ->

  class MainView extends Marionette.ItemView
    template: templateMain
    events: 'click .click': 'alertBox'
    alertBox: ->
      alert 'Button Clicked'
      return