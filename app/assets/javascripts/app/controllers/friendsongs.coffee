angular.module 'recom'
.controller 'FriendSongsController', [
  '$scope', '$stateParams', 'Song'
  ($scope, $stateParams, Song) ->

    $scope.current_song = {}

    Song.query({ type: 'friend', query: $stateParams.friendId }).$promise
    .then (songs) ->
      $scope.songs = songs
    .catch (response) ->
      console.log 'FAILURE'

    $scope.play = (song) ->
      $scope.current_song = song
]
