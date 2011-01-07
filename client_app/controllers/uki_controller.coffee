Backbone.UkiController = Backbone.Controller.extend
  views: {}
  viewPath: (->
    Backbone.Views ||= {}
    return Backbone.Views)()

  rootView: window
  # Bind all defined routes to `Backbone.history`.
  # @override

  _bindRoutes : () ->
    return unless @routes?
    callback = (name) ->
      console.log "#{name} action has been called."
      unless @views[name]?
        @views[name] = new (this._viewForAction(name))()
        @rootView.append @views[name]
      
      for name, view of @views
        view.visible(false)
      
      @views[name].visible(true)
      @views[name].layout()

      this[name]()

    for route, name of @routes
      console.log "making call back for #{name} using #{route}"
      this.route(route, name, _.bind(callback, this, name))

    return true

  # Overridable method to determine which view to be rendered
  # based on the name of the action. Defaults to using the
  # viewPaths property
  _viewForAction: (name) ->
    view = @viewPath[name]
    view ||= @viewPath[name.charAt(0).toUpperCase() + name.slice(1)]
    throw "Couldn't find view for view #{name} in #{@viewPath}" unless view?
    return view
