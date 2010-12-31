Citrus.Views.SplashIndexView = Backbone.UkiView.extend
  renderable: [{
      view: 'Box'
      rect: '0 0'
      anchors: 'left top right'
      childViews: [{
        view: 'Label'
        rect: '30 30 100 20'
        anchors: 'left top'
        text: "My Splashes"
      }]
    },{
    }]
