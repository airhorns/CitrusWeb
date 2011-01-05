(function() {
  Citrus.Views.Splashes.Index = Backbone.UkiView.extend({
    renderable: {
      view: 'Box',
      rect: '1000 1000',
      anchors: 'top bottom left right',
      childViews: [
        {
          view: 'Box',
          rect: '0 0 1000 100',
          anchors: 'left top right',
          childViews: [
            {
              view: 'Label',
              rect: '30 30 100 24',
              text: "My Splashes"
            }, {
              view: 'Button',
              rect: '140 30 100 24',
              text: "Add a Splash",
              id: 'new_splash'
            }
          ]
        }, {
          view: 'Table',
          rect: '0 200 1000 800',
          minSize: '0 200',
          anchors: 'left top right bottom',
          columns: [
            {
              view: 'table.NumberColumn',
              label: 'ID',
              width: 40,
              sort: 'ASC'
            }, {
              view: 'table.CustomColumn',
              label: 'Name',
              resizable: true,
              minWidth: 100,
              width: 250
            }, {
              view: 'table.NumberColumn',
              label: 'Time',
              resizable: true,
              width: 50
            }, {
              view: 'table.CustomColumn',
              label: 'Artist',
              resizable: true,
              minWidth: 100,
              width: 150
            }, {
              view: 'table.CustomColumn',
              label: 'Album',
              resizable: true,
              minWidth: 100,
              width: 150
            }, {
              view: 'table.CustomColumn',
              label: 'Genre',
              resizable: true,
              width: 100
            }, {
              view: 'table.NumberColumn',
              label: 'Rating',
              resizable: true,
              width: 30
            }, {
              view: 'table.NumberColumn',
              label: 'Play Count',
              resizable: true,
              width: 30
            }
          ],
          multiselect: true,
          style: {
            fontSize: '11px',
            lineHeight: '11px'
          }
        }
      ]
    },
    events: {
      'click Button[id=new_splash]': 'newSplash'
    },
    newSplash: function(e) {
      return window.location.hash = 'splash/new';
    }
  });
}).call(this);
