app = angular.module("Users",["ngResource","ngRoute"])

app.factory "User", ($resource) -> 
	$resource("/users/:id",{id: "@id" },{update: {method: "PUT"}})


@UserCntrl = (User,$scope,$resource,$location) ->
	$scope.validate = ->
		$scope.newUser.id=0
		user = User.get($scope.newUser, ->
			$scope.newUser=user
			if(user.id != undefined)
				$location.path('/list/');
			)

