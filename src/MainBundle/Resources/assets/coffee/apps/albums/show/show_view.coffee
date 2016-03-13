define [
  'app'
  'tpl!apps/albums/show/templates/empty.tpl'
  'tpl!apps/albums/show/templates/show.tpl'
], (AlbumManager, emptyTpl, viewTpl) ->
  AlbumManager.module 'AlbumApp.Show.View', (View, AlbumManager, Backbone, Marionette, $, _ ) ->
    View.Album = Marionette.ItemView.extend(
      template: viewTpl
      events: 'click #navigate-to': 'navigate'
      navigate: (e) ->
        e.preventDefault()

        AlbumManager.trigger 'album:item', this.model.get('id'), $(e.target).text()
    )

    View.EmptyAlbum = Marionette.ItemView.extend(
      template: emptyTpl
    )


  AlbumManager.AlbumApp.Show.View