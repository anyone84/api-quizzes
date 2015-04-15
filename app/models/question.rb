class Question < ActiveRecord::Base
   belongs_to :quiz
   has_many   :answers, dependent: :destroy

   default_scope { order("'order' ASC")}

   def correct_answer
      answers.detect{|answer|
         answer.correct_answer == true
      }
   end
end
