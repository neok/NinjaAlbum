define [
  'app'
  'apps/config/storage/localstorage'
], (AlbumManager) ->
  AlbumManager.module 'Entities', (Entities, AlbumManager, Backbone, Marionette, $, _) ->
    Entities.Album = Backbone.Model.extend(
      url: 'api/albums'
      defaults:
        name: ''

    )
    Entities.configureStorage 'AlbumManager.Entities.Album', Entities.Album
    Entities.AlbumCollection = Backbone.Collection.extend(
      url: '/api/albums'
      model: Entities.Album
      comparator: 'name')
    Entities.configureStorage 'AlbumManager.Entities.AlbumCollection', Entities.AlbumCollection

    initializeAlbums = ->
      albums = new (Entities.AlbumCollection)([
        {
          id: 1
          name: 'bro'
        }
        {
          id: 2
          name: 'no problems'
        }
        {
          id: 3
          name: 'bazooka'
        }
      ])
      albums.forEach (album) ->
        album.save()
        return
      albums.models

    API =
      getAlbumEntities: ->
        albums = new (Entities.AlbumCollection)
        defer = $.Deferred()
        albums.fetch success: (data) ->
          defer.resolve data
          return
        promise = defer.promise()
        $.when(promise).done (fetchedAlbums) ->
          console.log(fetchedAlbums)
          if fetchedAlbums.length == 0
            # if we don't have any albums yet, create some for convenience
            models = initializeAlbums()
            albums.reset models
          return
        promise
      getAlbumEntity: (albumId) ->
        album = new (Entities.Album)(id: albumId)
        defer = $.Deferred()
        setTimeout (->
          album.fetch
            success: (data) ->
              defer.resolve data
              return
            error: (data) ->
              defer.resolve undefined
              return
          return
        ), 2000
        defer.promise()
    AlbumManager.reqres.setHandler 'album:entities', ->
      API.getAlbumEntities()
    AlbumManager.reqres.setHandler 'album:entity', (id) ->
      API.getAlbumEntity id
    AlbumManager.reqres.setHandler 'album:entity:new', (id) ->
      new (Entities.Album)
    return
  return