jQuery( ($) ->
  Backbone.history = new Backbone.History()

  Citrus.AppView = new Citrus.Views.AppView()
  Citrus.AppView.attachTo($('#app')[0], '1000 1000')
  Citrus.Controller.prototype.rootView = Citrus.AppView
  
  Citrus.splashController = new Citrus.SplashesController()
  Backbone.history.start()
  
  return true
)

