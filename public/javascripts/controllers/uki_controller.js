(function() {
  Backbone.UkiController = Backbone.Controller.extend({
    views: {},
    viewPath: (function() {
      Backbone.Views || (Backbone.Views = {});
      return Backbone.Views;
    })(),
    rootView: window,
    _bindRoutes: function() {
      var callback, name, route, _ref;
      if (this.routes == null) {
        return;
      }
      callback = function(name) {
        var view, _ref;
        console.log("" + name + " action has been called.");
        if (this.views[name] == null) {
          this.views[name] = new (this._viewForAction(name))();
          this.rootView.append(this.views[name]);
        }
        _ref = this.views;
        for (name in _ref) {
          view = _ref[name];
          view.visible(false);
        }
        this.views[name].visible(true);
        this.views[name].layout();
        return this[name]();
      };
      _ref = this.routes;
      for (route in _ref) {
        name = _ref[route];
        console.log("making call back for " + name + " using " + route);
        this.route(route, name, _.bind(callback, this, name));
      }
      return true;
    },
    _viewForAction: function(name) {
      var view;
      view = this.viewPath[name];
      view || (view = this.viewPath[name.charAt(0).toUpperCase() + name.slice(1)]);
      if (view == null) {
        throw "Couldn't find view for view " + name + " in " + this.viewPath;
      }
      return view;
    }
  });
}).call(this);
