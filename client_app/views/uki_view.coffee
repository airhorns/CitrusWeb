###
  @constructor
  @name Backbone.UkiView
  @extends Backbone.View
###
Backbone.UkiView = Backbone.View.extend
  renderable: {}
  isUkiRendered: false

  constructor: () ->
    this.renderUki()

    getFunctions = (obj) ->
      funcs = []
      for key, func of obj
        funcs.push(key) if _.isFunction(func)
      return funcs

    functions = _(getFunctions(@ukiView)).chain().concat(getFunctions(@ukiView[0])).uniq().value()
    for name in functions
      this[name] = _.bind(@ukiView[name], @ukiView) unless _.isUndefined(@ukiView[name]) || name.indexOf("_") == 0 || !_.isUndefined(this[name])
    Backbone.View.apply(this, arguments)
    return this

  ### 
    Finds the object to give to Uki to build the actual uki view from
    @private
  ###
  getRenderable: () ->
    if _.isFunction(@renderable)
      return @renderable()
    else
      return @renderable

  ### 
    Renders the uki view using this classes renderable. Caches the rendered uki view unless force is passed
    @param {Boolean=false} force Forces the re-rendering of the view if it's already been cached.
  ###
  renderUki: (force=false) ->
    return if @isUkiRendered || force
    renderable = this.getRenderable()
    #throw "Can't use an array to build a uki view, please use one root view and then add child views" if _.isArray(renderable)
    
    # Get the rendered collection
    @ukiView ?= uki.build(renderable)
    throw "Unable to build ukiView with the provided renderable!" unless @ukiView?
    @ukiView.backboneView = this
    @ukiView[0].backboneView = this if @ukiView[0]?
    this.el = @ukiView.dom()

    # Give this object the same iterable properties as the collection
    this.length = 0
    Array.prototype.push.call(this, item) for item in @ukiView

    @isUkiRendered = true

  # Backbone compatibility hook.
  # @override
  render: ->
    this.renderUki(true)
    return this

  # @override
  el: false

  # @override
  _ensureElement: ->
    return true
  
  # Since we're using Uki views, we can't really make more instances like this. Maybe
  # this will change in the future.
  # @override
  make: () ->
    throw "Can't make a ukiView element, must subclass and add a renderable property."

  # Convienience method for Backbone compatibilty to remove this UkiView from the heirarchy.
  # @override
  remove: () ->
    parent = this.parent()
    # if uki.Collection
    if parent.length?
      parent = parent[0]
    
    if parent.removeChild?
      parent.removeChild(@ukiView)
    else
      # Probably a uki.Attachment. Remove from the dom.
      parent.domForChild().removeChild(@ukiView.dom())
      uki.Attachment.instances = _.reject(uki.Attachment.instances, (i) -> i == parent)

  # Parent wrapper to allow setting of parent directly on the first object instead of the collection which doesnt set anything
  parent: () ->
    @ukiView[0].parent.apply(@ukiView[0], arguments)

  # Convenience method for accessing the Backbone.View that is parent to this one
  parentView: () ->
    this.parent()

  # Convenience method for accessing the parent uki.Collection that is parent to this one (may have just one view)
  parentCollection: () ->
    this.parentBackbone()?.ukiView
  
  # Convenience method for accessing the Backbone.View that is parent to this one.
  parentBackbone: () ->
    this.parent()?.backboneView

  #
  delegateEvents : (events) ->
    return if !(events || (events = this.events))
    @boundEvents ||= {}
    for name, objects of @boundEvents
      for [object, callback] in objects
        object.unbind(name, callback)

    for key, methodName of events
      match = key.match(/^(\w+)\s*(.*)$/)
      eventName = match[1]
      selector = match[2]
      method = _.bind(this[methodName], this)
      @boundEvents[eventName] ||= []
      if (selector == '')
        @ukiView.bind(eventName, method)
        @boundEvents[eventName].push([@ukiView, method])
       else
        object = uki(selector, @ukiView)
        object.bind(eventName, method)
        @boundEvents[eventName].push([object, method])
    return true
