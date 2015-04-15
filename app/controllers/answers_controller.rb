class AnswersController < ApplicationController
   before_filter :load_answers, only: [:index]
   before_filter :load_answer,  only: [:show, :update, :delete] 

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
   def load_answers
      @answers = Answer.all
   end
   def load_answer
      @answer = Answer.find(params[:id])
   end  
end
