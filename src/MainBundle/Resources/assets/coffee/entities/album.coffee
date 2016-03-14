define [
  'app'
], (AlbumManager) ->
  AlbumManager.module 'Entities', (Entities, AlbumManager, Backbone, Marionette, $, _) ->
    Entities.Album = Backbone.Model.extend(
      urlRoot: 'api/album/'
      url: ->
        url = this.urlRoot + this.id
        if this.get 'page'
          url += "?page=" + this.get('page')
        url
    )

    Entities.AlbumCollection = Backbone.Collection.extend(
      url: 'api/albums'
      model: Entities.Album)

    API =
      getAlbumEntities: ->
        albums = new (Entities.AlbumCollection)
        albums.fetch ({})
        albums.forEach (album) ->
          album.save()
        albums

      getAlbumEntity: (albumId, page) ->

        album = new (Entities.Album)({id: albumId, page: page})
        defer = $.Deferred()
        setTimeout  (->
          album.fetch(
            success: (data) ->
              defer.resolve data

            error: (data) ->
              defer.resolve undefined
          )
        ), 2500
        defer.promise()

    AlbumManager.reqres.setHandler 'album:entities', ->
      API.getAlbumEntities()

    AlbumManager.reqres.setHandler 'album:entity', (id, page) ->
      API.getAlbumEntity id, page


