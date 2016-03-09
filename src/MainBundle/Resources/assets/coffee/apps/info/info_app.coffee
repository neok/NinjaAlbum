define [
  'app'
  'marionette'
], (AlbumManager, Marionette) ->

  Router = Marionette.AppRouter.extend(appRoutes: 'info': 'showAbout')

  API = showAbout: ->
    require [ 'apps/info/show/show_controller' ], (ShowController) ->
      AlbumManager.startSubApp null
      ShowController.showAbout()

  AlbumManager.on 'info:show', ->
    AlbumManager.navigate 'info'
    API.showAbout()

  AlbumManager.on 'before:start', ->
    new Router(controller: API)

  Router