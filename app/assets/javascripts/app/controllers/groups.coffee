angular.module 'recom'
.controller 'GroupsController', [
  '$scope', 'Group', '$state'
  ($scope, Group, $state) ->
    Group.query().$promise
    .then (groups) ->
      $scope.groups = groups
    .catch (response) ->
      console.log 'FAILURE'

    $scope.openGroup = (group) ->
      $state.go 'app.group', { groupId: group.id }
]
