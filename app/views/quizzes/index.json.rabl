object false

node :quizzes do
   @quizzes.map{|t| partial('quizzes/show_index', :object => t)}
end