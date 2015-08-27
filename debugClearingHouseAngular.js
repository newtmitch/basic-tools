// Directive for easily adding debug output to an Angular-backed web page. Usually I put this after the .config() method
// call in app.js in an angular-fullstack instance.
angular.module('myApp')
    .directive('debugClearingHouse', function ($filter) {
        return {
            transclude: true,
            link: function (scope, element, attrs) {
                scope.$watch(attrs.data, function (localData) {
                        var topLevel = angular.element('<div class="container"><a name="debugAnchor"></a> <div class="pure-g">' +
                            '<div class="pure-u-1"> <h4 style="color: red">Mitch\'s Debug Clearing House</h4> </div></div></div>');
                        var preElem = angular.element('<pre></pre>');
                        preElem.append($filter('json')(localData));
                        topLevel.append(preElem);
                        element.empty();
                        element.append(topLevel);
                    },
                    true); // objectEquality
            }
        }
    });

// The associated HTML in the web page would be the following (uncommented, of course), where the data element is the
// variable on the scope that should be rendered into the page.
// <div debug-clearing-house data="techRows"></div>
