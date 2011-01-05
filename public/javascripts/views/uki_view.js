(function() {
  /*
    @constructor
    @name Backbone.UkiView
    @extends Backbone.View
  */  Backbone.UkiView = Backbone.View.extend({
    renderable: {},
    isUkiRendered: false,
    constructor: function() {
      var functions, getFunctions, name, _i, _len;
      this.renderUki();
      getFunctions = function(obj) {
        var func, funcs, key;
        funcs = [];
        for (key in obj) {
          func = obj[key];
          if (_.isFunction(func)) {
            funcs.push(key);
          }
        }
        return funcs;
      };
      functions = _(getFunctions(this.ukiView)).chain().concat(getFunctions(this.ukiView[0])).uniq().value();
      for (_i = 0, _len = functions.length; _i < _len; _i++) {
        name = functions[_i];
        if (!(_.isUndefined(this.ukiView[name]) || name.indexOf("_") === 0 || !_.isUndefined(this[name]))) {
          this[name] = _.bind(this.ukiView[name], this.ukiView);
        }
      }
      Backbone.View.apply(this, arguments);
      return this;
    },
    /*
      Finds the object to give to Uki to build the actual uki view from
      @private
    */
    getRenderable: function() {
      if (_.isFunction(this.renderable)) {
        return this.renderable();
      } else {
        return this.renderable;
      }
    },
    /*
      Renders the uki view using this classes renderable. Caches the rendered uki view unless force is passed
      @param {Boolean=false} force Forces the re-rendering of the view if it's already been cached.
    */
    renderUki: function(force) {
      var item, renderable, _i, _len, _ref, _ref2;
      if (force == null) {
        force = false;
      }
      if (this.isUkiRendered || force) {
        return;
      }
      renderable = this.getRenderable();
      (_ref = this.ukiView) != null ? _ref : this.ukiView = uki.build(renderable);
      if (this.ukiView == null) {
        throw "Unable to build ukiView with the provided renderable!";
      }
      this.ukiView.backboneView = this;
      if (this.ukiView[0] != null) {
        this.ukiView[0].backboneView = this;
      }
      this.el = this.ukiView.dom();
      this.length = 0;
      _ref2 = this.ukiView;
      for (_i = 0, _len = _ref2.length; _i < _len; _i++) {
        item = _ref2[_i];
        Array.prototype.push.call(this, item);
      }
      return this.isUkiRendered = true;
    },
    render: function() {
      this.renderUki(true);
      return this;
    },
    el: false,
    _ensureElement: function() {
      return true;
    },
    make: function() {
      throw "Can't make a ukiView element, must subclass and add a renderable property.";
    },
    remove: function() {
      var parent;
      parent = this.parent();
      if (parent.length != null) {
        parent = parent[0];
      }
      if (parent.removeChild != null) {
        return parent.removeChild(this.ukiView);
      } else {
        parent.domForChild().removeChild(this.ukiView.dom());
        return uki.Attachment.instances = _.reject(uki.Attachment.instances, function(i) {
          return i === parent;
        });
      }
    },
    parent: function() {
      return this.ukiView[0].parent.apply(this.ukiView[0], arguments);
    },
    parentView: function() {
      return this.parent();
    },
    parentCollection: function() {
      var _ref;
      return (_ref = this.parentBackbone()) != null ? _ref.ukiView : void 0;
    },
    parentBackbone: function() {
      var _ref;
      return (_ref = this.parent()) != null ? _ref.backboneView : void 0;
    },
    delegateEvents: function(events) {
      var callback, eventName, key, match, method, methodName, name, object, objects, selector, _base, _i, _len, _ref, _ref2;
      if (!(events || (events = this.events))) {
        return;
      }
      this.boundEvents || (this.boundEvents = {});
      _ref = this.boundEvents;
      for (name in _ref) {
        objects = _ref[name];
        for (_i = 0, _len = objects.length; _i < _len; _i++) {
          _ref2 = objects[_i], object = _ref2[0], callback = _ref2[1];
          object.unbind(name, callback);
        }
      }
      for (key in events) {
        methodName = events[key];
        match = key.match(/^(\w+)\s*(.*)$/);
        eventName = match[1];
        selector = match[2];
        method = _.bind(this[methodName], this);
        (_base = this.boundEvents)[eventName] || (_base[eventName] = []);
        if (selector === '') {
          this.ukiView.bind(eventName, method);
          this.boundEvents[eventName].push([this.ukiView, method]);
        } else {
          object = uki(selector, this.ukiView);
          object.bind(eventName, method);
          this.boundEvents[eventName].push([object, method]);
        }
      }
      return true;
    }
  });
}).call(this);
