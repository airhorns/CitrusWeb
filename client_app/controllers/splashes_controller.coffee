Citrus.Views.Splashes = {}
Citrus.SplashesController = Citrus.Controller.extend
  viewPath: Citrus.Views.Splashes
  routes:
    "": "index"
    "splash/new": "new"
    "splash/edit": "edit"

  index: ->
  new: ->
  edit: ->
