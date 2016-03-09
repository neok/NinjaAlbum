define [
  'app'
  'backbone.picky'
], (AlbumManager) ->
  AlbumManager.module 'Entities', (Entities, AlbumManager, Backbone, Marionette, $, _) ->
    Entities.Header = Backbone.Model.extend(initialize: ->
      selectable = new (Backbone.Picky.Selectable)(this)
      _.extend this, selectable
    )
    Entities.HeaderCollection = Backbone.Collection.extend(
      model: Entities.Header
      initialize: ->
        singleSelect = new (Backbone.Picky.SingleSelect)(this)
        _.extend this, singleSelect
    )

    initializeHeaders = ->
      Entities.headers = new (Entities.HeaderCollection)([
        {
          name: 'Albums'
          url: 'albums'
          navigationTrigger: 'albums:list'
        }
        {
          name: 'Info'
          url: 'info'
          navigationTrigger: 'info:show'
        }
      ])

    API = getHeaders: ->
      if Entities.headers == undefined
        initializeHeaders()
      Entities.headers
    AlbumManager.reqres.setHandler 'header:entities', ->
      API.getHeaders()
