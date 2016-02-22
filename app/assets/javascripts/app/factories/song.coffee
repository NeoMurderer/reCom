angular.module 'recom'
.factory 'Song', [
  '$resource'
  ($resource) ->
    $resource(
      '/songs/:songId'
      null
      {}
    )
]
