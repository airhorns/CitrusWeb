(function() {
  Backbone.UkiController = Backbone.Controller.extend({
    views: {},
    viewPath: (function() {
      Backbone.Views || (Backbone.Views = {});
      return Backbone.Views;
    })(),
    rootView: window,
    _bindRoutes: function() {
      var callback, name, route, _ref, _results;
      if (this.routes == null) {
        return;
      }
      _ref = this.routes;
      _results = [];
      for (route in _ref) {
        name = _ref[route];
        callback = function() {
          var view, _base, _i, _len, _ref, _ref2;
          if (this.views[name] == null) {
            (_ref = (_base = this.views)[name]) != null ? _ref : _base[name] = new (this._viewForAction(name))();
            this.rootView.append(this.views[name]);
          }
          _ref2 = this.views;
          for (_i = 0, _len = _ref2.length; _i < _len; _i++) {
            view = _ref2[_i];
            view.visible(false);
          }
          this.views[name].layout();
          this.views[name].visible(true);
          return this[name]();
        };
        _results.push(this.route(route, name, callback));
      }
      return _results;
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
