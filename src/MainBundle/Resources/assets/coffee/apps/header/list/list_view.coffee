define [
  'app'
  'tpl!apps/header/list/templates/list.tpl'
  'tpl!apps/header/list/templates/list_item.tpl'
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
# add class so Bootstrap will highlight the active entry in the navbar
          @$el.addClass 'active'
    )
    View.Headers = Marionette.CompositeView.extend(
      template: listTpl
      className: 'navbar navbar-inverse navbar-fixed-top'
      childView: View.Header
      childViewContainer: 'ul'
      events: 'click a.brand': 'brandClicked'
      brandClicked: (e) ->
        e.preventDefault()
        @trigger 'brand:clicked'
    )

  AlbumManager.HeaderApp.List.View