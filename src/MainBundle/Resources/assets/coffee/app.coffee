define [
  'marionette'
  "jquery-ui"
], (
  Marionette
) ->

  AlbumManager = new Marionette.Application

  AlbumManager.navigate = (route, options) ->
    if options == null
      options = {}
    Backbone.history.navigate route, options


  AlbumManager.getCurrentRoute = ->
    Backbone.history.fragment


  AlbumManager.on 'before:start', ->
  RegionContainer = Marionette.LayoutView.extend(
    el: '#app-container'
    regions:
      header: '#header-region'
      main: '#main-region'
      dialog: '#dialog-region')
  AlbumManager.regions = new RegionContainer

  AlbumManager.regions.dialog.onShow = (view) ->
    self = this

    closeDialog = ->
      self.stopListening()
      self.empty()
      self.$el.dialog 'destroy'
      return

    @listenTo view, 'dialog:close', closeDialog
    @$el.dialog
      modal: true
      title: view.title
      width: 'auto'
      close: (e, ui) ->
        closeDialog()


  AlbumManager.startSubApp = (appName, args) ->
    currentApp = if appName then AlbumManager.module(appName) else null
    if AlbumManager.currentApp == currentApp
      return
    if AlbumManager.currentApp
      AlbumManager.currentApp.stop()
    AlbumManager.currentApp = currentApp
    if currentApp
      currentApp.start args



  AlbumManager.on 'start', ->
  if Backbone.history
    require [
      'apps/info/info_app'
    ], ->
      Backbone.history.start()
      if AlbumManager.getCurrentRoute() == ''
        AlbumManager.trigger 'info:show'


  AlbumManager