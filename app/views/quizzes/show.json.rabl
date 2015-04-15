object @quiz
attributes :id, :name, :description, :quiz_date

node :questions, :if => lambda { |t| !t.questions.blank? } do |quiz|
   quiz.questions.map{|q| partial("questions/show", :object => q)}
end

node :solutions, :if => lambda { |t| !t.questions.blank? } do |quiz|
   quiz.questions.map{|q| q.correct_answer.order rescue nil}
end