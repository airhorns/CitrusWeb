(function() {
  Citrus.SplashesController = Backbone.Controller.extend({
    views: {},
    routes: {
      "": "index",
      "splash/new": "new",
      "splash/edit": "edit"
    },
    initialize: function() {},
    "new": function() {},
    index: function() {
      var _base, _ref;
      if (this.views['index'] == null) {
        (_ref = (_base = this.views)['index']) != null ? _ref : _base['index'] = new Citrus.Views.SplashIndexView();
        Citrus.AppView.appendChild(this.views['index']);
      }
      return this.views['index'].visible(true);
    }
  });
}).call(this);
