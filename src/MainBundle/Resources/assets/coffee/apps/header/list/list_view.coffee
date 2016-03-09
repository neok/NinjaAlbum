define [
  'app'
  'text!apps/header/list/templates/list.html'
  'text!apps/header/list/templates/list_item.html'
], (AlbumManager, listTpl, listItemTpl) ->
  AlbumManager.module 'HeaderApp.List.View', (View, AlbumManager, Backbone, Marionette, $, _) ->
    View.Header = Marionette.ItemView.extend(
      template: listItemTpl
      tagName: 'li'
      events: 'click a': 'navigate'
      navigate: (e) ->
        e.preventDefault()
        @trigger 'navigate', @model
      onRender: ->
        if @model.selected
          @$el.addClass 'active'
    )
    View.Headers = Marionette.CompositeView.extend(
      template: listTpl
      className: 'navbar'
      childView: View.Header
      childViewContainer: 'ul'
      events: 'click a.brand': 'brandClicked'
      brandClicked: (e) ->
        e.preventDefault()
        @trigger 'brand:clicked'
    )

  AlbumManager.HeaderApp.List.View