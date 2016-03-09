define [
  'app'
  'apps/header/list/list_controller'
], (AlbumManager, ListController) ->
  AlbumManager.module 'HeaderApp', (Header, AlbumManager, Backbone, Marionette, $, _) ->
    API = listHeader: ->
      ListController.listHeader()
      return
    AlbumManager.commands.setHandler 'set:active:header', (name) ->
      ListController.setActiveHeader name
      return
    Header.on 'start', ->
      API.listHeader()
      return
    return
  AlbumManager.HeaderApp
