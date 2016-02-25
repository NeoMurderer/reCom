angular.module 'recom'
.controller 'ApplicationController', [
  '$scope', '$auth', '$state','$cable'
  ($scope, $auth, $state,$cable) ->
    $scope.signOut = ->
      $auth.logout()
      $state.go 'login'
    cable = $cable('ws://0.0.0.0:3000/cable?token='+$auth.getToken());
    channel = cable.subscribe('EventsChannel', { received: (response)->
      console.log response
    });
    console.log cable.connection.isOpen()
]
