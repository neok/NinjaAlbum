define [
  'app'
  'apps/info/show/show_view'
], (AlbumManager, View) ->
  { showAbout: ->
    view = new (View.Message)
    AlbumManager.regions.main.show view
  }