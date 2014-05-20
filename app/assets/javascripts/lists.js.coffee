app = angular.module("Lists",["ngResource","ngAnimate"])



app.factory "List", ($resource) -> 
	$resource("/lists/:id",{id: "@id" },{update: {method: "PUT"}})


@ListCntrl = (List,Session,$scope,$resource,$location) -> 
	$scope.tasks = []
	$scope.index = 1

 $scope.load = (idx)->
 	maxidx = Math.ceil($scope.lists.length / 2) 
 	if idx>0 and idx<=maxidx
 		$scope.listp = ($scope.lists[(idx-1)*2...(idx)*2])
 		$scope.range = new Array(maxidx)
 		$scope.index = idx

 $scope.init = ->
	$scope.lists = List.query(->
		$scope.load(1)
	)
	
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
 	$scope.load(1)

 $scope.deleteList = (idx)-> 
 	list = List.delete({id: $scope.lists[idx].id}) 
 	$scope.lists.splice(idx,1)
 	$scope.load(1)

 $scope.showTask = (idx)-> 
 	tasks = $resource("/task/list/"+(idx)).query()   
 	$scope.tasks.push(tasks)
 	sharedProperties.setProperty(idx)
 	$scope.property = sharedProperties.getProperty()
 
  
 