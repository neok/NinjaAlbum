define [
  'marionette'
  'tpl!apps/info/show/templates/info.tpl'
], (Marionette, infoTpl) ->

  { Message: Marionette.ItemView.extend(template: infoTpl) }