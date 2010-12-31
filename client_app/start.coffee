jQuery( ($) ->
  Citrus.AppView = new Citrus.Views.AppView()
  Citrus.AppView.attachTo($('#app')[0])
  Citrus.AppView.render()

  Citrus.splashController = new Citrus.SplashesController()
  Backbone.history.start()
  return true
)

