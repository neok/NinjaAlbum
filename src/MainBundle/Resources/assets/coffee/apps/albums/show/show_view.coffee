define [
  'app'
  'tpl!apps/albums/show/templates/empty.tpl'
  'tpl!apps/albums/show/templates/show.tpl'
], (AlbumManager, emptyTpl, viewTpl) ->
  AlbumManager.module 'AlbumApp.Show.View', (View, AlbumManager, Backbone, Marionette, $, _ ) ->
    View.Album = Marionette.ItemView.extend(
      template: viewTpl
    )

    View.EmptyAlbum = Marionette.ItemView.extend(
      template: emptyTpl
    )


  AlbumManager.AlbumApp.Show.View