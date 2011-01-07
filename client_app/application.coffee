#Citrus.renderTemplate = (templateString) ->
  #Citrus._compiledHandlebars ?= {}
  #i = Citrus._compiledHandlebars.length
  #return ->
    #Citrus._compiledHandlebars[i] ?= Handlebars.compile(templateString)
    #return Citrus._compiledHandlebars[i](arguments[0], arguments[1])

#Backbone.View.prototype.render = ->
  #$(this.el).html(JST[this.classname](this.model.toJSON()))
  #return this
