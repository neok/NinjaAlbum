define [ 'app' ], (AlbumManager) ->
  AlbumManager.module 'AlbumApp', (AlbumApp, AlbumManager, Backbone, Marionette, $, _) ->
    AlbumApp.startWithParent = false

    AlbumApp.onStart = ->
      return

    AlbumApp.onStop = ->
      return

    return
  AlbumManager.AlbumApp
