app = angular.module("Todo",["Lists","Tasks","ngRoute"])

app.config ($routeProvider) ->
  $routeProvider.when '/', templateUrl: '/static_pages/index'
  $routeProvider.when '/list_task/:id', templateUrl: '/static_pages/task/'
  $routeProvider.otherwise redirectTo: '/'

app.service "sharedProperties", ->
  property = "first"
  getProperty: ->
    property

  setProperty: (value) ->
    property = value
    return
