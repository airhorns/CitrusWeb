require('/javascripts/views/uki_view.js')

button =
  view: 'Button'
  rect: '100 100'
  anchors: 'left top'
  text: "Test!"
  id: 'test_button'

label =
  view: 'Label'
  rect: '100 100'
  anchors: 'right top'
  text: "Informative text."
  id: 'test_label'

box =
  view: 'Box'
  rect: '500 500'
  anchors: 'left top right bottom'

composite =
  view: 'Box'
  rect: '500 500'
  anchors: 'left top right bottom'
  childViews: [button, label]

multi = [box, button]


describe 'UkiView', ->
  it 'should quack like an array', ->
    klass = Backbone.UkiView.extend
      renderable: multi

    view = new klass()
    expect(view.length).toEqual(2)
    expect(view[0]).toBeDefined()
    expect(view[1]).toBeDefined()

  it 'should render basic views', ->
    klass = Backbone.UkiView.extend
      renderable: button
    
    view = new klass()
    view.attachTo(testBed())
    expect($testBed().html()).toMatch("Test!")
  
  it 'should allow null renderables', ->
    klass = Backbone.UkiView.extend
      renderable: {}
    
    view = new klass()

  describe 'UkiView DOM Events', ->
    klass = false
    beforeEach ->
      klass = Backbone.UkiView.extend
        renderable: composite
        events:
          'click': 'clicked'
          'click #test_button': 'buttonClicked'
          'click #test_label': 'labelClicked'
        clicked: -> console.log("clicked")
        buttonClicked: -> console.log("buttonClicked")
        labelClicked: -> console.log("labelClicked")

    
    it 'should listen for events', ->
      view = new klass()
      view.attachTo(testBed())
      spyOn(view, 'clicked').andCallThrough()
      view.delegateEvents()
      
      view.ukiView.trigger('click')

      expect(view.clicked).toHaveBeenCalled()
    
    it 'should listen for events scoped by selector', ->
      view = new klass()
      view.attachTo(testBed())
      spyOn(view, 'buttonClicked').andCallThrough()
      spyOn(view, 'clicked').andCallThrough()
      view.delegateEvents()

      uki('Button', view).trigger('click')
      expect(view.buttonClicked).toHaveBeenCalled()

  it 'should allow addition of nested views and track the parent property', ->
    klass = Backbone.UkiView.extend
      renderable: box
    buttonKlass = Backbone.UkiView.extend
      renderable: button
    
    view = new klass()
    subView = new buttonKlass()

    view.attachTo(testBed())
    expect($testBed().html()).not.toMatch("Test!")
    view.appendChild(subView)
    expect($testBed().html()).toMatch("Test!")

    expect(subView.parentCollection()).toEqual(view.ukiView)
    expect(subView.parent()).toEqual(view.ukiView[0])
    expect(subView.parentView()).toEqual(view.ukiView[0])
    expect(subView.parentBackbone()).toEqual(view)

  it 'should allow removal of views', ->
    klass = Backbone.UkiView.extend
      renderable: button
    
    view = new klass()
    view.attachTo(testBed())
    
    expect($testBed().html()).toMatch("Test!")
    view.remove()
    expect($testBed().html()).not.toMatch("Test!")

  it 'should allow removal of nested views', ->
    klass = Backbone.UkiView.extend
      renderable: box

    buttonKlass = Backbone.UkiView.extend
      renderable: button
    
    view = new klass()
    subView = new buttonKlass()

    view.attachTo(testBed())
    view.appendChild(subView)
    
    expect($testBed().html()).toMatch("Test!")
    subView.remove()
    expect($testBed().html()).not.toMatch("Test!")
  
  it 'should render views with children', ->
    klass = Backbone.UkiView.extend
      renderable: composite
    
    view = new klass()
    view.attachTo(testBed())
    expect($testBed().html()).toMatch("Test!")
    expect($testBed().html()).toMatch("Informative text.")
