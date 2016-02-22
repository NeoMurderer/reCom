angular.module 'recom'
.controller 'LoginController', [
  '$scope', '$auth', '$state'
  ($scope, $auth, $state) ->

    $scope.signIn = ->
      $auth.authenticate('vkontakte')
      .then ->
        $state.go 'app.songs'
      .catch (response) ->
        console.log 'FAILURE'
]
