angular.module 'recom'
.factory 'Friend', [
  '$resource'
  ($resource) ->
    $resource(
      '/friends/:friendId'
      null
      {}
    )
]
