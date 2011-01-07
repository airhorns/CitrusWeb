(function() {
  Citrus.Views.Splashes.New = Backbone.UkiView.extend({
    renderable: {
      view: 'HSplitPane',
      rect: '1000 1000',
      anchors: 'left top right bottom',
      handlePosition: 300,
      leftMin: 200,
      rightMin: 600
    }
  });
}).call(this);
