'use strict';

/* Controllers */

var opeQuizControllers = angular.module('opeQuizControllers', []);

opeQuizControllers.controller('QuizListCtrl', ['$scope', '$http',
  function($scope, $http) {  
    $http.get('/quizzes.json').success(
      function(data) {
        $scope.quizzes = data.quizzes;
      }
    );
  }
]);

opeQuizControllers.controller('QuizCtrl', ['$scope', '$routeParams', '$http',
  function($scope, $routeParams, $http){
    $http.get('/quizzes/' + $routeParams.quizId + '.json').success(
      function(data){
         $scope.quiz      = data.quiz;
         $scope.solutions = data.quiz.solutions;
         $scope.answers   = new Array($scope.solutions.length); 
      }
    );

    $scope.selectAnswer = function(questionOrder, answerOrder){
      $.each($(".qs"+questionOrder), function(index, val) {
         $(val).removeClass('check');
         $(val).removeClass('ok');
         $(val).removeClass('ko');
      });      
      $("#ans"+answerOrder+"q"+questionOrder).addClass('check');
      console.log($scope.answers);
      $scope.answers[questionOrder] = answerOrder;

      $scope.numberOfAnswers = $.map($scope.answers, function(item, index) {
        return item;
      }).length;
    },

    $scope.checkQuiz = function(){
      $scope.numberOfCorrectAnswers = 0;
      $.each($scope.answers, function(question, selectedAnswer) {
         var correctAnswer = $scope.solutions[question];
         if(selectedAnswer != undefined){
            if(correctAnswer == selectedAnswer){
              $("#ans"+selectedAnswer+"q"+question).addClass('ok');
              $scope.numberOfCorrectAnswers++;
            }else{
              $("#ans"+correctAnswer+"q"+question).addClass('ok');
              $("#ans"+selectedAnswer+"q"+question).addClass('ko');
            }
         }
         $('#dialog').modal()
      });
      console.log($scope.numberOfCorrectAnswers);

    }
  }
]);

