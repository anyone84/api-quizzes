class QuizzesController < ApplicationController
   before_filter :load_quizzes, only: [:index]
   before_filter :load_quiz,  only: [:show, :update, :delete]

   def index
   end
   
   def show
   end

   def update
   end

   def create
   end

   def delete
   end

   private
   def load_quizzes
      @quizzes = Quiz.all
   end
   def load_quiz
      @quiz = Quiz.find(params[:id])
   end  
end
