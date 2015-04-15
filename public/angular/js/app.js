'use strict';

/* App Module */

var phonecatApp = angular.module('opeQuizApp', [
  'ngRoute',
  'opeQuizControllers'
]);

phonecatApp.config(['$routeProvider',
  function($routeProvider) {
    $routeProvider.
      when('/quizzes', {
        templateUrl: 'partials/quiz-list.html',
        controller: 'QuizListCtrl'
      }).
      when('/quizzes/:quizId', {
        templateUrl: 'partials/quiz.html',
        controller: 'QuizCtrl'
      }).
      otherwise({
        redirectTo: '/quizzes'
      });
  }]);
