app = angular.module("Users",["ngResource","ngRoute","ngCookies"])

app.factory "User", ($resource) -> 
	$resource("/users/:id",{id: "@id" },{update: {method: "PUT"}})

app.factory "Sessionout", ($resource) -> 
	$resource("/user/session/logout/:id",{id: "@id" },{update: {method: "PUT"}})




@UserCntrl = (User,Sessionout,$cookies,$scope,$resource,$location) ->
	$scope.exist = true
	$scope.invalid = false
	
	$scope.validate = ->
		if ($scope.newUser is undefined)
			alert ("Enter detail");
			return

		$scope.newUser.id=0
		user = User.get($scope.newUser, ->
			$scope.newUser=user
			if(user.id != undefined)
				$location.path('/list/');
				$cookies.login ='true';
				$cookies.username = user.email;
			else
				$cookies.username = '';
				$scope.invalid = true;
			)

	$scope.reg = ->
		if($scope.newUser == undefined || $scope.newUser.password isnt $scope.newUser.passwordAgain || $scope.newUser.password == undefined)
			alert "Check password"
			return

	
		user = User.save($scope.newUser,->
			if(user.email == null)
				$scope.exist = false
			else
				$location.path('/list/');
				$cookies.login ='true';
				$cookies.username = user.email;		
		)

	$scope.loadreg = ->
		$location.path("/reg");		
				
		
							
