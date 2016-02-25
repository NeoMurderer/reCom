ngSoundManager.directive('shuffleMusic', ['angularPlayer', function (angularPlayer) {
        return {
            restrict: "EA",
            link: function (scope, element, attrs) {

                element.bind('click', function (event) {
                    angularPlayer.shuffleToggle();
                });

                scope.repeat = angularPlayer.getRepeatStatus();
                scope.$on('music:shuffle', function (event, data) {
                    scope.$apply(function () {
                        scope.shuffle = data;
                    });
                });
            }
        };
    }]);
