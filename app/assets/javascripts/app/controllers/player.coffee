angular.module 'recom'
.controller 'PlayerController', [
  '$scope', '$state','$rootScope'
  ($scope, $state,$rootScope) ->
    $rootScope.showPlaylist = false;
    $scope.togglePlaylist = () ->
      $rootScope.showPlaylist = !$rootScope.showPlaylist



]
