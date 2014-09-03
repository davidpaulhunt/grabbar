app = angular.module "Grabba", ["ngStorage"]

app.controller "ListsController", ($scope, $localStorage, $sessionStorage) ->

  $scope.$storage = $localStorage

  if !$scope.$storage.lists
    $scope.$storage.lists = []

  $scope.list = {}
  $scope.list.items = []

  $scope.addList = ->
    $scope.creatingList = 'false'
    $scope.list.createdAt = Date.now()
    $scope.$storage.lists.push($scope.list)
    $scope.list = {}

  $scope.removeAll = ->
    $scope.$storage.reset()

  $scope.removeList = (list) ->
    lists = $scope.$storage.lists
    listPosition = lists.indexOf list
    lists.splice(listPosition, 1)
    return $scope.$storage.lists

  $scope.logList = (list) ->
    console.log list

  $scope.viewList = (list) ->

app.controller "ItemsController", ($scope) ->

  $scope.item = {}

  $scope.addItem = (list) ->
    newItem = $scope.item
    newItem.createdAt = Date.now()
    newItem.toPurchase = true
    list.items.push(newItem)
    $scope.item = {}