define ['wreqr', 'models/album', 'collections/albums'], (wreqr, Album, Albumes) ->

  wreqr.reqres.setHandler 'albums:entities', () ->
    albums = new Albums

    albums.fetch
      data: {}
    albums

  wreqr.reqres.setHandler 'album:entities', (id = null, success = null) ->
    if id == null
      return new Album
    album = new Album
      id: id
    album.fetch
      success: success
    album