requirejs.config
  waitSeconds: 15
  paths:
    backbone: "vendor/backbone"
    "backbone.picky": "vendor/backbone.picky"
    "backbone.syphon": "vendor/backbone.syphon"
    jquery: "vendor/jquery"
    lodash: "vendor/lodash"
    "jquery-ui": "vendor/jquery-ui"
    json2: "vendor/json2"
    localstorage: "vendor/backbone.localstorage"
    marionette: "vendor/backbone.marionette"
    'backbone.babysitter': 'vendor/backbone.babysitter'
    'backbone.wreqr': 'vendor/backbone.wreqr'
    spin: "vendor/spin"
    "spin.jquery": "vendor/jquery.spin"
    text: "vendor/text"
    underscore: "vendor/underscore"
    tpl: "vendor/underscore-tpl"

  shim:
    bootstrap:
      deps: ['jquery']
    underscore:
      exports: "_"

    backbone:
      deps: ["jquery", "underscore", "json2"]
      exports: "Backbone"

    "backbone.picky": ["backbone"]
    "backbone.syphon": ["backbone"]
    marionette:
      deps: ["backbone"]
      exports: "Marionette"

    "jquery-ui": ["jquery"]
    localstorage: ["backbone"]
    "spin.jquery": ["spin", "jquery"]
    tpl: ["text"]

require [
  'app'
  "apps/info/info_app"
  "apps/albums/album_app"
  "apps/header/header_app"
], (AlbumManager) ->
  AlbumManager.start()