app = angular.module("Tasks",["ngResource"])

app.factory "Task", ($resource) -> 
	$resource("/tasks/:id",{id: "@id" },{update: {method: "PUT"}})

@EntryCntrl = (Task,$scope) -> 
	$scope.tasks = Task.query()

 $scope.addTask = ->
 	task = Task.save($scope.newTask)
 	$scope.tasks.unshift(task)
 	$scope.newTask = {} 

 $scope.deleteTask = (idx)-> 
 	task = Task.delete({id: $scope.tasks[idx].id}) 
 	$scope.tasks.splice(idx,1)