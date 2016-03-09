define [ 'app', 'apps/albums/album_app_router' ], (AlbumManager, AlbumRouter) ->

  AlbumManager.module 'AlbumApp', (AlbumApp, AlbumManager, Backbone, Marionette, $, _) ->
    AlbumApp.startWithParent = false

    AlbumApp.onStart = ->


    AlbumApp.onStop = ->

  AlbumManager.AlbumApp
