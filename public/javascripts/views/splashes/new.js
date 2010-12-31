(function() {
  Citrus.Views.NewSplashView = Backbone.UkiView.extend({
    constructor: function() {},
    renderable: {
      view: 'HSplitPane',
      rect: '1000 600',
      anchors: 'left top right bottom',
      handlePosition: 300,
      leftMin: 200,
      rightMin: 800
    }
  });
}).call(this);
