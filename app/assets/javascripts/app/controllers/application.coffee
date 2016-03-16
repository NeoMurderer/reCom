angular.module 'recom'
.controller 'ApplicationController', [
  '$scope', '$auth', '$state','$cable','angularPlayer',"$rootScope"
  ($scope, $auth, $state,$cable,angularPlayer,$rootScope) ->
    $scope.signOut = ->
      $auth.logout()
      $state.go 'login'
    $rootScope.cable = $cable('ws://0.0.0.0:3000/cable?token='+$auth.getToken());
    $rootScope.channel = $rootScope.cable.subscribe('EventsChannel', { received: (response)->
      if !response
        return
      if response.platform == "mobile"
        event = response.event.replace("com.snazzis.recom:id/","")
        $scope.events[event](response.data)
    });
    $scope.events = {
      playerPlay: () ->
        angularPlayer.play()
      playerPause: () ->
        angularPlayer.pause()
      playerNext: () ->
        angularPlayer.nextTrack()
      playerPrev: () ->
        angularPlayer.prevTrack()
      mute: () ->
        angularPlayer.mute()




    }
]
