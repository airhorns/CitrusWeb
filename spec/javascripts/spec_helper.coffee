require('/javascripts/underscore.js')
require('/javascripts/backbone.js')
require('/javascripts/uki.js')
require('/javascripts/jquery.js')

testBed = null

window.$testBed = ->
  testBed ?= jQuery('#test')

window.testBed = ->
  window.$testBed()[0]

old = jasmine.ExpectationResult
jasmine.ExpectationResult = (params) ->
  this.type = 'expect'
  this.matcherName = params.matcherName
  this.passed_ = params.passed
  this.expected = params.expected
  this.actual = params.actual

  this.message = if this.passed_ then 'Passed.' else params.message
  this.trace = if this.passed_ then '' else (params.exception || new Error(params.message)) # Changed line to give better stack traces on Chrome.
  return this

jasmine.util.inherit jasmine.ExpectationResult, old
jasmine.Spec.prototype.fail = (e) ->
  expectationResult = new jasmine.ExpectationResult
    passed: false
    message: if e then jasmine.util.formatException(e) else 'Exception'
    exception: e
  this.results_.addResult(expectationResult)

