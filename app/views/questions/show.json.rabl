object @question
attributes :id, :order, :question_text
node :answers, :if => lambda { |q| !q.answers.blank? } do |question|
   question.answers.map{|a| partial("answers/show", object: a)}
end