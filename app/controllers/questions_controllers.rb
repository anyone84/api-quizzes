class QuestionsController < ApplicationController
   before_filter :load_questions, only: [:index]
   before_filter :load_question,  only: [:show, :update, :delete]

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
   def load_questions
      @questions = Question.all
   end
   def load_question
      @question = Question.find(params[:id])
   end  
end
