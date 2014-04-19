app = angular.module("Lists",["ngResource"])

app.factory "List", ($resource) -> 
	$resource("/lists/:id",{id: "@id" },{update: {method: "PUT"}})

@ListCntrl = (List,$scope,$resource) -> 
	$scope.lists = List.query()
	$scope.tasks = []


 $scope.getTask = (idx)->   
 	$scope.tasks.push($resource("/task/list/"+(idx+1)).query())

 $scope.addList = ->
 	list = List.save($scope.newList)
 	$scope.lists.unshift(list)
 	$scope.tasks.unshift("") 

 $scope.deleteList = (idx)-> 
 	list = List.delete({id: $scope.lists[idx].id}) 
 	$scope.lists.splice(idx,1)

 