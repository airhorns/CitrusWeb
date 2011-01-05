jQuery( ($) ->
  Citrus.AppView = new Citrus.Views.AppView()
  Citrus.AppView.attachTo($('#app')[0], '950 1000')
  Citrus.Controller.prototype.rootView = Citrus.AppView

  Citrus.splashController = new Citrus.SplashesController()
  Backbone.history.start()
  return true
)

