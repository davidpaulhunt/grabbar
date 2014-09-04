app = angular.module "Grabba", ["ngStorage"]

app.controller "ListsController", ($scope, $localStorage, $sessionStorage) ->


  $scope.$storage = $localStorage

  if !$scope.$storage.lists
    $scope.$storage.lists = []

  $scope.list = {}
  $scope.list.items = []

  $scope.addList = ->
    $scope.currentlist = $scope.list
    $scope.viewList($scope.list)
    console.log $scope.list
    $scope.creatingList = 'false'
    $scope.list.createdAt = Date.now()
    $scope.$storage.lists.push($scope.list)
    $scope.list = {}
    $scope.list.items = []

  $scope.removeAll = ->
    $scope.$storage.reset()

  $scope.removeList = (list) ->
    $scope.singleview = 'false'
    lists = $scope.$storage.lists
    listPosition = lists.indexOf list
    lists.splice(listPosition, 1)

  $scope.logList = (list) ->
    console.log list

  $scope.viewList = (list) ->
    $scope.currentlist = list
    $scope.singleview = 'true'

  $scope.backToAll = ->
    delete $scope.currentlist
    console.log "List deleted."

app.controller "ItemsController", ($scope) ->

  $scope.item = {}

  $scope.addItem = (list) ->
    $scope.item.createdAt = Date.now()
    $scope.item.toPurchase = true
    list.items.push($scope.item)
    $scope.item = {}

  $scope.purchaseItem = (item) ->
    alert "Made it to purchase."
    item.toPurchase = false
    console.log item

  $scope.removeItem = (list, item) ->
    if confirm "Remove item forever?"
      itemPosition = list.items.indexOf item
      list.items.splice(itemPosition, 1)
      list