angular.module 'recom'
.controller 'ApplicationController', [
  '$scope', '$auth', '$state'
  ($scope, $auth, $state) ->
    $scope.signOut = ->
      $auth.logout()
      $state.go 'login'
]
