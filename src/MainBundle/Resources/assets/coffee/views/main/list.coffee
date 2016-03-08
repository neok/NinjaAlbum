define [
  'marionette'
  'backbone'
  'views/main/item'
  'text!templates/main/list.html'
], (Marionette, Backbone, ItemView, Template) ->

  class ListView extends Marionette.CollectionView
    template: Template
    itemView: ItemView
    itemViewEventPrefix: 'item'