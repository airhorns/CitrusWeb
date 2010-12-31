(function() {
  Citrus.renderTemplate = function(templateString) {
    var i, _ref;
    (_ref = Citrus._compiledHandlebars) != null ? _ref : Citrus._compiledHandlebars = {};
    i = Citrus._compiledHandlebars.length;
    return function() {
      var _base, _ref;
      (_ref = (_base = Citrus._compiledHandlebars)[i]) != null ? _ref : _base[i] = Handlebars.compile(templateString);
      return Citrus._compiledHandlebars[i](arguments[0], arguments[1]);
    };
  };
  Backbone.View.prototype.render = function() {
    $(this.el).html(JST[this.classname](this.model.toJSON()));
    return this;
  };
}).call(this);
