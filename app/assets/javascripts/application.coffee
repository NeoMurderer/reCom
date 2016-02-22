# = require jquery/dist/jquery
# = require bootstrap-sass/assets/javascripts/bootstrap-sprockets
# = require angular/angular
# = require angular-ui-router/release/angular-ui-router
# = require angular-resource/angular-resource
# = require satellizer/satellizer
# = require_self
# = require_tree ./app

angular.module 'recom', [
  'ui.router'
  'satellizer'
  'ngResource'
]
