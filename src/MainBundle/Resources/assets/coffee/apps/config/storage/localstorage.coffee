define [
  'app'
  'localstorage'
], (AlbumManager) ->
  AlbumManager.module 'Entities', (Entities, AlbumManager, Backbone, Marionette, $, _) ->

    findStorageKey = (entity) ->
      # use a model's urlRoot value
      if entity.urlRoot
        return _.result(entity, 'urlRoot')
      # use a collection's url value
      if entity.url
        return _.result(entity, 'url')
      throw new Error('Unable to determine storage key')
      return

    storageCache = {}

    getStorage = (key) ->
      storage = storageCache[key]
      if storage
        return storage

      newStorage = new (Backbone.LocalStorage)(key)
      storageCache[key] = newStorage
      newStorage

    StorageMixin = (entityPrototype) ->
      storageKey = findStorageKey(entityPrototype)
      { localStorage: getStorage(storageKey) }

    Entities.configureStorage = (constructorString, constructor) ->
      OldConstructor = constructor

      NewConstructor = ->
        obj = new OldConstructor(arguments[0], arguments[1])
        _.extend obj, new StorageMixin(OldConstructor.prototype)
        obj

      NewConstructor.prototype = OldConstructor.prototype
      eval constructorString + ' = NewConstructor;'
      return

    return
  AlbumManager.Entities.configureStorage