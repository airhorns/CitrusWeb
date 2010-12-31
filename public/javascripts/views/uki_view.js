(function() {
  /*
    @constructor
    @name Backbone.UkiView
    @extends Backbone.View
  */  Backbone.UkiView = Backbone.View.extend({
    renderable: {},
    isUkiRendered: false,
    constructor: function() {
      var name, _i, _len, _ref;
      this.renderUki();
      uki;
      _ref = _.functions(this.ukiView.prototype);
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        name = _ref[_i];
        this[name] = _.bind(this.ukiView[name], this.ukiView);
      }
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
      var renderable, _ref;
      if (force == null) {
        force = false;
      }
      if (this.isUkiRendered || force) {
        return;
      }
      renderable = this.getRenderable();
      if (_.isArray(renderable)) {
        throw "Can't use an array to build a uki view, please use one root view and then add child views";
      }
      (_ref = this.ukiView) != null ? _ref : this.ukiView = uki.build(renderable)[0];
      if (this.ukiView == null) {
        throw "Unable to build ukiView with the provided renderable!";
      }
      this.isUkiRendered = true;
      return this.isUkiRendered;
    },
    render: function() {
      this.renderUki(true);
      return this;
    },
    el: function() {
      return this.ukiView.dom();
    },
    make: function() {
      throw "Can't make a ukiView element, must subclass and add a renderable property.";
    },
    remove: function() {
      var parent;
      parent = this.ukiView.parent();
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
    }
  });
}).call(this);
