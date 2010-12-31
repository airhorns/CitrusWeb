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
    uki
    for name in _.functions(@ukiView.prototype)
      this[name] = _.bind(@ukiView[name], @ukiView)
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
    throw "Can't use an array to build a uki view, please use one root view and then add child views" if _.isArray(renderable)
    
    # Pick the first of the rendered collection
    @ukiView ?= uki.build(renderable)[0]
    throw "Unable to build ukiView with the provided renderable!" unless @ukiView?
    @isUkiRendered = true
    return @isUkiRendered

  # Backbone compatibility hook.
  # @override
  render: ->
    this.renderUki(true)
    return this

  # @override
  el: () ->
    @ukiView.dom()

  # Since we're using Uki views, we can't really make more instances like this. Maybe
  # this will change in the future.
  # @override
  make: () ->
    throw "Can't make a ukiView element, must subclass and add a renderable property."

  # Convienience method for Backbone compatibilty to remove this UkiView from the heirarchy.
  # @override
  remove: () ->
    parent = @ukiView.parent()
    # if uki.Collection
    if parent.length?
      parent = parent[0]
    
    if parent.removeChild?
      parent.removeChild(@ukiView)
    else
      # Probably a uki.Attachment. Remove from the dom.
      parent.domForChild().removeChild(@ukiView.dom())
      uki.Attachment.instances = _.reject(uki.Attachment.instances, (i) -> i == parent)
