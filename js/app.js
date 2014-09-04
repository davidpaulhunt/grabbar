// Generated by CoffeeScript 1.8.0
(function() {
  var app;

  app = angular.module("Grabba", ["ngStorage"]);

  app.controller("ListsController", function($scope, $localStorage, $sessionStorage) {
    $scope.$storage = $localStorage;
    if (!$scope.$storage.lists) {
      $scope.$storage.lists = [];
    }
    $scope.list = {};
    $scope.list.items = [];
    $scope.addList = function() {
      $scope.currentlist = $scope.list;
      $scope.viewList($scope.list);
      console.log($scope.list);
      $scope.creatingList = 'false';
      $scope.list.createdAt = Date.now();
      $scope.$storage.lists.push($scope.list);
      $scope.list = {};
      return $scope.list.items = [];
    };
    $scope.removeAll = function() {
      return $scope.$storage.reset();
    };
    $scope.removeList = function(list) {
      var listPosition, lists;
      $scope.singleview = 'false';
      lists = $scope.$storage.lists;
      listPosition = lists.indexOf(list);
      return lists.splice(listPosition, 1);
    };
    $scope.logList = function(list) {
      return console.log(list);
    };
    $scope.viewList = function(list) {
      $scope.currentlist = list;
      return $scope.singleview = 'true';
    };
    return $scope.backToAll = function() {
      delete $scope.currentlist;
      return console.log("List deleted.");
    };
  });

  app.controller("ItemsController", function($scope) {
    $scope.item = {};
    $scope.addItem = function(list) {
      $scope.item.createdAt = Date.now();
      $scope.item.toPurchase = true;
      list.items.push($scope.item);
      return $scope.item = {};
    };
    $scope.purchaseItem = function(item) {
      alert("Made it to purchase.");
      item.toPurchase = false;
      return console.log(item);
    };
    return $scope.removeItem = function(list, item) {
      var itemPosition;
      if (confirm("Remove item forever?")) {
        itemPosition = list.items.indexOf(item);
        list.items.splice(itemPosition, 1);
        return list;
      }
    };
  });

}).call(this);
