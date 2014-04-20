app = angular.module("Tasks",["ngResource","ngRoute"])

app.factory "Task", ($resource) -> 
	$resource("/tasks/:id",{id: "@id" },{update: {method: "PUT"}})

@EntryCntrl = (Task,$scope,$resource,$routeParams) -> 
	$scope.tasks = $resource("/task/list/"+($routeParams.id)).query()  
	$scope.complete = 0
	$scope.progress = 0

 $scope.count = ->
 	$scope.complete = 0
 	for task in $scope.tasks
 		if task.completed == true
 			$scope.complete++


 $scope.addTask = ->
 	$scope.newTask.completed = false
 	$scope.newTask.list_id = $routeParams.id
 	task = Task.save($scope.newTask)
 	$scope.tasks.push(task)
 	$scope.newTask = {} 


 $scope.update = (item)->
 	Task.update({id: item.id})


 $scope.deleteTask = (item)-> 
 	$scope.tasks.splice($scope.tasks.indexOf(item),1)
 	task = Task.delete({id: item.id}) 
 	

 $scope.clearAll = -> 
 	task = Task.delete()
 	$scope.tasks = {} 
 	