Citrus.SplashesController = Backbone.Controller.extend
  views: {}
  routes:
    "": "index"
    "splash/new": "new"
    "splash/edit": "edit"
  
  initialize: ->

  new: ->

  index: ->
    unless @views['index']?
      @views['index'] ?= new Citrus.Views.SplashIndexView()
      Citrus.AppView.appendChild @views['index']
    @views['index'].visible(true)
