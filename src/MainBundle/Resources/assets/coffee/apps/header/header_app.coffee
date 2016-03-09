define [
  'app'
  'apps/header/list/list_controller'
], (AlbumManager, List) ->

  AlbumManager.module 'HeaderApp', (Header, AlbumManager, Backbone, Marionette, $, _) ->
    API = listHeader: ->
      List.Controller.listHeader()

    AlbumManager.commands.setHandler 'set:active:header', (name) ->
      List.Controller.setActiveHeader name

    Header.on 'start', ->
      API.listHeader()

  AlbumManager.HeaderApp
