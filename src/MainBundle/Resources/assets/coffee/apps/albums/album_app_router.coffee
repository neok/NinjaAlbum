define [ 'app' ], (AlbumManager) ->
  AlbumManager.module 'Routers.AlbumApp', (AlbumAppRouter, AlbumManager, Backbone, Marionette, $, _) ->
    AlbumAppRouter.Router = Marionette.AppRouter.extend(appRoutes:
      'albums': 'listAlbums',
      'albums/:id': 'showAlbum',
      'albums/:id/page/:page_id': 'showAlbum')

    executeAction = (action, arg) ->
      AlbumManager.startSubApp 'AlbumApp'
      action arg
      AlbumManager.execute 'set:active:header', 'albums'

    API =
      listAlbums: () ->
        require [ 'apps/albums/list/list_controller' ], (ListController) ->
          executeAction ListController.listAlbums

      showAlbum: (id, page) ->
        require ['apps/albums/show/show_controller' ], (ShowController) ->
          executeAction ShowController.showAlbum(id, page)

    AlbumManager.on 'albums:list', ->
      AlbumManager.navigate 'albums'
      API.listAlbums()

    AlbumManager.on 'album:item', (id, page) ->
      AlbumManager.navigate 'albums/' + id + '/page/' + page
      API.showAlbum(id, page)

    AlbumManager.Routers.on 'start', ->
      new (AlbumAppRouter.Router)(controller: API)

  AlbumManager.AlbumAppRouter
