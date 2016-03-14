define [
  'app'
  'tpl!apps/albums/list/templates/layout.tpl'
  'tpl!apps/albums/list/templates/panel.tpl'
  'tpl!apps/albums/list/templates/list.tpl'
  'tpl!apps/albums/list/templates/list_item.tpl'
], (AlbumManager, layoutTpl, panelTpl, listTpl, listItemTpl) ->
  AlbumManager.module 'AlbumApp.List.View', (View, AlbumManager, Backbone, Marionette, $, _) ->
    View.Layout = Marionette.LayoutView.extend(
      template: layoutTpl
      regions:
        panelRegion: '#panel-region'
        albumsRegion: '#albums-region')

    View.Album = Marionette.ItemView.extend(
      tagName: 'tr'
      template: listItemTpl
      events:
        'click': 'highlightName'
      triggers:
        'click td a.js-show': 'album:show'
    )


    View.Albums = Marionette.CompositeView.extend(
      tagName: 'table'
      className: 'table table-hover'
      template: listTpl
      childView: View.Album
      childViewContainer: 'tbody'
      initialize: ->
        @listenTo @collection, 'reset', ->
          @attachHtml = (collectionView, childView, index) ->
            collectionView.$el.append childView.el
            return

          return
        return
      onRenderCollection: ->
        @attachHtml = (collectionView, childView, index) ->
          collectionView.$el.prepend childView.el
          return

        return
    )
    return
  AlbumManager.AlbumApp.List.View