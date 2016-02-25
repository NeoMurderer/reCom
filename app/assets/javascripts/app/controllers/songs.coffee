angular.module 'recom'
.controller 'SongsController', [
  '$scope', 'Song'
  ($scope, Song) ->
    $scope.current_song = {}
    $scope.loadTrack = () ->
      Song.query({name:$scope.query}).$promise
      .then (songs) ->
        $scope.songs = songs
      .catch (response) ->
        console.log 'FAILURE'

    $scope.resetSearch = () ->
      $scope.query = null
]
