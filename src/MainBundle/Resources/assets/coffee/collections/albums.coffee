define ['backbone', 'models/album'], (Backbone, Album) ->

  class Albums extends Backbone.Collection
    model: Album
    url: 'api/albums'