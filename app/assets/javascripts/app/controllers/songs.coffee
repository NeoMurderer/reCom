angular.module 'recom'
.controller 'SongsController', [
  '$scope', 'Song'
  ($scope, Song) ->
    $scope.current_song = {}

    Song.query().$promise
    .then (songs) ->
      $scope.songs = songs
    .catch (response) ->
      console.log 'FAILURE'

    $scope.play = (song) ->
      $scope.current_song = song
]
