define [
  'app'
  'tpl!common/templates/loader.tpl'
  'spin.jquery'
], (AlbumManager, loadingTpl) ->
  AlbumManager.module 'Common.Views', (Views, AlbumManager, Backbone, Marionette, $, _) ->
    Views.Loading = Marionette.ItemView.extend(
      template: loadingTpl
      title: 'Loading Data'
      message: 'Please wait.'
      serializeData: ->
        {
        title: Marionette.getOption(this, 'title')
        message: Marionette.getOption(this, 'message')
        }
      onShow: ->
        opts =
          lines: 12
          length: 18
          width: 10
          radius: 30
          corners: 1
          rotate: 0
          direction: 1
          color: '#000'
          speed: 1
          trail: 60
          shadow: false
          hwaccel: false
          className: 'spinner'
          zIndex: 2e9
          top: '30px'
          left: 'auto'
        $('#spinner').spin opts
    )

  AlbumManager.Common.Views