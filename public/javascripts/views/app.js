(function() {
  Citrus.Views.AppView = Backbone.UkiView.extend({
    renderable: {
      view: 'Container',
      rect: '1000 600',
      anchors: 'left top right bottom',
      childViews: [
        {
          view: 'Label',
          rect: '100 100',
          anchors: 'left top',
          text: "Test!"
        }
      ]
    }
  });
}).call(this);
