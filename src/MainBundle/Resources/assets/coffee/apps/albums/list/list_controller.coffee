define [
  'app'
  'apps/albums/list/list_view'
], (AlbumManager, View) ->
  AlbumManager.module 'AlbumApp.List', (List, AlbumManager, Backbone, Marionette, $, _) ->
    List.Controller = listAlbums: () ->
      require [
        'common/views'
        'entities/album'
      ], (CommonViews) ->

        loadingView = new (CommonViews.Loading)
        AlbumManager.regions.main.show loadingView
        fetchingAlbums = AlbumManager.request('album:entities')
        albumListLayout = new (View.Layout)

        albumsListView = new (View.Albums)(collection: fetchingAlbums)

        albumListLayout.on 'show', ->
          albumListLayout.albumsRegion.show albumsListView

        albumsListView.on "childview:album:show", (childView, args) ->
          AlbumManager.trigger("album:show", args.model.get("id"));

        AlbumManager.regions.main.show albumListLayout

  AlbumManager.AlbumApp.List.Controller
