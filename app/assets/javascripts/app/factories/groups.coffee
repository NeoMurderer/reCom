angular.module 'recom'
.factory 'Group', [
  '$resource'
  ($resource) ->
    $resource(
      '/groups/:groupId'
      null
      {}
    )
]
