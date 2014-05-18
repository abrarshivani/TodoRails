app = angular.module("Todo",["Lists","Tasks","ngRoute","Users"])

app.factory "Session", ($resource) -> 
  $resource("/user/session/login/:id",{id: "@id" },{update: {method: "PUT"}})

app.factory "Sessionout", ($resource) -> 
  $resource("/user/session/logout/:id",{id: "@id" },{update: {method: "PUT"}})



app.config ($routeProvider) ->
  $routeProvider.when '/', templateUrl: '/static_pages/index'
  $routeProvider.when '/list/', templateUrl: '/static_pages/list'
  $routeProvider.when '/list_task/:id', templateUrl: '/static_pages/task/'
  $routeProvider.when '/reg', templateUrl: '/static_pages/reg'
  $routeProvider.when '/contactus', templateUrl: '/static_pages/contactus'
  $routeProvider.otherwise redirectTo: '/'

@TodoCntrl = (Session,Sessionout,$scope,$cookies,$resource,$location,$route) ->  
 
 $scope.isLogin = ->
  session = Session.get(->
        status=session.status
        if (status == undefined or status == 1 or status == null)
           $scope.test = false
           if $location.path() in ['/list/']
              $location.path('/')
           else
              $location.path($location.path())
        else
           $scope.test = true
           if $location.path() in ['/','/reg']  
              $location.path('/list')
           else
              $location.path($location.path())
        )

 $scope.login = ->
    
    $log=log=$cookies.login
    console.log($cookies.login)
    $scope.test = false
    if (log == 'false' || log==undefined)
        $scope.test = false
        if $location.path() in ['/list/']
            $location.path('/')
        else
            $location.path($location.path())
    else
        $scope.test = true
        if $location.path() in ['/','/reg']  
            $location.path('/list')
        else
            $location.path($location.path())
      
                

  $scope.logout  = ->
    Sessionout.save()
    $scope.test = false
    $cookies.login='false'
    $location.path('/')
