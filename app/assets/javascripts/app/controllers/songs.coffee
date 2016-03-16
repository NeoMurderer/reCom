angular.module 'recom'
.controller 'SongsController', [
  '$scope', 'Song','$rootScope','angularPlayer','$timeout'
  ($scope, Song,$rootScope,angularPlayer,$timeout) ->
    $scope.current_song = {}
    $scope.loadTrack = () ->
      Song.query({name:$scope.query}).$promise
      .then (songs) ->
        $scope.songs = songs
        # $timeout(() ->
        #   angular.forEach(songs, (value,index) ->
        #     $scope.$apply(() ->
        #       angularPlayer.addToPlaylist(value)
        #     )
        #   );
        #   angularPlayer.initPlayTrack(songs[0].id)
        # )
      .catch (response) ->
        console.log 'FAILURE'
    $scope.resetSearch = () ->
      $scope.query = null
      $scope.loadTrack()
    $scope.loadTrack()
    $scope.playTrack = (track) ->
      $timeout (->
        angularPlayer.playTrack(track.id)
      ), 0
    return
]
