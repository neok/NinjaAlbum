define [
  'app'
  'tpl!apps/albums/show/templates/empty.tpl'
  'tpl!apps/albums/show/templates/show.tpl'
], (AlbumManager, emptyTpl, viewTpl) ->
  AlbumManager.module 'AlbumApp.Show.View', (View, AlbumManager, Backbone, Marionette, $, _ ) ->
    View.Album = Marionette.ItemView.extend(
      template: viewTpl
      events:
        'click .navigate-to': 'navigate'
        'click .previous': 'previous'
        'click .next': 'next'
        'click .disabled': 'disable'
      navigate: (e) ->
        e.preventDefault()
        AlbumManager.trigger 'album:item', this.model.get('id'), $(e.target).text()

      disable: (e) ->
        e.preventDefault()

      previous: (e) ->
        e.preventDefault()
        page = this.model.get('page')
        if (page != null && page > 1)
          page = page - 1
        else
          page = 1
        AlbumManager.trigger 'album:item', this.model.get('id'), page

      next: (e) ->
        e.preventDefault()
        page = this.model.get('page')
        if (page != null && page > 0)
          page = page + 1
        AlbumManager.trigger 'album:item', this.model.get('id'), page

    )

    View.EmptyAlbum = Marionette.ItemView.extend(
      template: emptyTpl
    )


  AlbumManager.AlbumApp.Show.View