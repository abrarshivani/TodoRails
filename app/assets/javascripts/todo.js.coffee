app = angular.module("Todo",["Lists","Tasks","ngRoute"])

app.config ($routeProvider) ->
  $routeProvider.when '/', templateUrl: '/static_pages/index'
 