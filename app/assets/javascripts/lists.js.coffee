app = angular.module("Lists",["ngResource","ngAnimate"])



app.factory "List", ($resource) -> 
	$resource("/lists/:id",{id: "@id" },{update: {method: "PUT"}})


@ListCntrl = (List,Session,$scope,$resource,$location) -> 
	$scope.lists = List.query()
	$scope.tasks = []
	

 $scope.getTask = (idx)->
 	$location.path('/list_task/'+idx);
 	
 $scope.isLogin = ->
 	session = Session.get(->
				status=session.status
				if (status == undefined)
					$location.path('/');
				)


 $scope.addList = ->
 	list = List.save($scope.newList)
 	$scope.lists.unshift(list)
 	$scope.tasks.unshift("") 

 $scope.deleteList = (idx)-> 
 	list = List.delete({id: $scope.lists[idx].id}) 
 	$scope.lists.splice(idx,1)

 $scope.showTask = (idx)-> 
 	tasks = $resource("/task/list/"+(idx)).query()   
 	$scope.tasks.push(tasks)
 	sharedProperties.setProperty(idx)
 	$scope.property = sharedProperties.getProperty()
 
  
 