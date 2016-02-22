angular.module 'recom'
.filter 'trusted', [
  '$sce',
  ($sce) ->
    (url) ->
      $sce.trustAsResourceUrl url
]
