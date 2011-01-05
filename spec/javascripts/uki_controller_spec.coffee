require '/javascripts/controllers/uki_controller.js', ->
  ControllerClass = false

  class MockView
    _visible: true
    visible: (arg) ->
      return @_visible unless arg?
      @_visible = arg

    layout: ->
      return true

    append: ->
      return true


  #Cached regex for cleaning hashes.
  hashStrip = /^#*/

  class MockHistory extends Backbone.History
    location: ""
    start : ->
    getFragment : () ->
      return @location.replace(hashStrip, '')
    mockVisit: (loc) ->
      @location = loc
      this.checkUrl()

  Test = {}
  describe "A simple UkiView controller", ->
    beforeEach(->
      Test =
        Views: {index: MockView, one: MockView}
        AppView: new MockView()

      ControllerClass = Backbone.UkiController.extend
        routes:
          "index" : 'index'
          "one/:param" : 'one'
        viewPath: Test.Views
        rootView: Test.AppView
        index: ->
        one: ->

      Backbone.history = new MockHistory()
    )
   
    it("should render a test view according to the viewPath", ->
      controller = new ControllerClass()
      view = false
      spyOn(Test.AppView, 'append').andCallFake( (appendedView )->
        view = appendedView
        spyOn(view, 'layout')
      )
      Backbone.history.mockVisit("index")

      expect(view.visible()).toEqual(true)
      expect(view.layout).toHaveBeenCalled()
    )
