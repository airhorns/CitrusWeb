require('/javascripts/views/uki_view.js')

button =
  view: 'Button'
  rect: '100 100'
  anchors: 'left top'
  text: "Test!"

label =
  view: 'Label'
  rect: '100 100'
  anchors: 'right top'
  text: "Informative text."

box =
  view: 'Box'
  rect: '500 500'
  anchors: 'left top right bottom'

composite =
  view: 'Box'
  rect: '500 500'
  anchors: 'left top right bottom'
  childViews: [button, label]

describe 'UkiView', ->
  it 'should render basic views', ->
    klass = Backbone.UkiView.extend
      renderable: button
    
    view = new klass()
    view.attachTo(testBed())
    expect($testBed().html()).toMatch("Test!")

  it 'should allow addition of nested views', ->
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
