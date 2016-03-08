
define [
  'marionette'
  'text!templates/main/item.html'
], (Marionette
  Template) ->

  class ItemView extends Marionette.ItemView
    template: Template
    tagName: 'a href="#"'
    className: 'album-list'