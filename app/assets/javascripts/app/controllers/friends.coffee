angular.module 'recom'
.controller 'FriendsController', [
  '$scope', 'Friend', '$state'
  ($scope, Friend, $state) ->
    Friend.query().$promise
    .then (friends) ->
      $scope.friends = friends
    .catch (response) ->
      console.log 'FAILURE'

    $scope.openFriend = (friend) ->
      $state.go 'app.friend', { friendId: friend.id }
]
