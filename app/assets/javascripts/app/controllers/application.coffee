angular.module 'recom'
.controller 'ApplicationController', [
  '$scope', '$auth', '$state','$cable','angularPlayer'
  ($scope, $auth, $state,$cable,angularPlayer) ->
    $scope.signOut = ->
      $auth.logout()
      $state.go 'login'
    cable = $cable('ws://0.0.0.0:3000/cable?token='+$auth.getToken());
    channel = cable.subscribe('EventsChannel', { received: (response)->
      if !response.event
        return
      $scope.events[response.event.user_action](response.data)
    });
    $scope.events = {
      play: () ->
        angularPlayer.play()
      pause: () ->
        angularPlayer.pause()
      nextTrack: () ->
        angularPlayer.nextTrack()
      prevTrack: () ->
        angularPlayer.prevTrack()
      mute: () ->
        angularPlayer.mute()




    }
    console.log cable.connection.isOpen()
]
