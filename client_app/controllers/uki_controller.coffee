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
    for route, name of @routes
      callback = ->
        unless @views[name]?
          @views[name] ?= new (this._viewForAction(name))()
          @rootView.append @views[name]
        view.visible(false) for view in @views
        @views[name].layout()
        @views[name].visible(true)

        this[name]()

      this.route(route, name, callback)

  # Overridable method to determine which view to be rendered
  # based on the name of the action. Defaults to using the
  # viewPaths property
  _viewForAction: (name) ->
    view = @viewPath[name]
    view ||= @viewPath[name.charAt(0).toUpperCase() + name.slice(1)]
    throw "Couldn't find view for view #{name} in #{@viewPath}" unless view?
    return view
