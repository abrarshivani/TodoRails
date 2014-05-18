app = angular.module("Users",["ngResource","ngRoute"])

app.factory "User", ($resource) -> 
	$resource("/users/:id",{id: "@id" },{update: {method: "PUT"}})

app.factory "Sessionout", ($resource) -> 
	$resource("/user/session/logout/:id",{id: "@id" },{update: {method: "PUT"}})




@UserCntrl = (User,Sessionout,$scope,$resource,$location) ->
	$scope.exist = true
	$scope.invalid = false
	$scope.validate = ->
		$scope.newUser.id=0
		user = User.get($scope.newUser, ->
			$scope.newUser=user
			if(user.id != undefined)
				$location.path('/list/');
			$scope.invalid = true;
			)

	$scope.reg = ->
		user = User.save($scope.newUser,->
			if(user.email == null)
				$scope.exist = false
			else
				$location.path("/list");		
			)

	$scope.loadreg = ->
		$location.path("/reg");		
				


	$scope.logout  = ->
		Sessionout.get()
		$route.reload()
 	
		
							
