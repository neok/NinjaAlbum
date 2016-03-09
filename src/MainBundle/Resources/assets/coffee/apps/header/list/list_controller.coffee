define [
  'app'
  'apps/header/list/list_view'
], (AlbumManager, View) ->
  AlbumManager.module 'HeaderApp.List', (List, AlbumManager, Backbone, Marionette, $, _) ->
    List.Controller =
      listHeader: ->
        require [ 'entities/header' ], ->
          links = AlbumManager.request('header:entities')
          headers = new (View.Headers)(collection: links)
          headers.on 'brand:clicked', ->
            AlbumManager.trigger 'album:list'

          headers.on 'childview:navigate', (childView, model) ->
            trigger = model.get('navigationTrigger')
            AlbumManager.trigger trigger

          AlbumManager.regions.header.show headers

      setActiveHeader: (headerUrl) ->
        links = AlbumManager.request('header:entities')
        headerToSelect = links.find((header) ->
          header.get('url') == headerUrl
        )
        headerToSelect.select()
        links.trigger 'reset'
