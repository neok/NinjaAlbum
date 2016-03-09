define [
  'marionette'
  'text!apps/info/show/templates/info.html'
], (Marionette, infoTpl) ->

  { Message: Marionette.ItemView.extend(template: infoTpl) }