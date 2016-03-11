define [
  'app'
  'apps/albums/show/show_view'
], (AlbumManager, View) ->
  AlbumManager.module 'AlbumApp.Show', (Show, AlbumManager, Backbone, Marionetter, $, _) ->
    Show.Controller = showAlbum: (id) ->
      require [
        'common/views'
        'entities/album'
      ], (CommonViews) ->
        loadingView = new CommonViews.Loading
        AlbumManager.regions.main.show loadingView

        fetching = AlbumManager.request 'album:entity', id
        $.when (fetching).done (album) ->
          albumView = new View.Album(
            model: album
          )
          AlbumManager.regions.main.show albumView



  AlbumManager.AlbumApp.Show.Controller