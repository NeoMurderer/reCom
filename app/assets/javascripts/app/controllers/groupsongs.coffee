angular.module 'recom'
.controller 'GroupSongsController', [
  '$scope', '$stateParams', 'Song'
  ($scope, $stateParams, Song) ->

    $scope.current_song = {}

    Song.query({ type: 'group', query: $stateParams.groupId }).$promise
    .then (songs) ->
      $scope.songs = songs
    .catch (response) ->
      console.log 'FAILURE'

    $scope.play = (song) ->
      $scope.current_song = song
]
