# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Quiz.destroy_all
1.upto(20) do |idx| 
   puts " --- Creating Quiz #{idx}"
   q = Quiz.create({
      name:          "Quiz #{idx}",
      description:   Faker::Lorem.paragraph,
      quiz_date:     Date.today - rand(100000).hours
   })
   q.save
   1.upto(10) do |idxqs|
      puts " --- === Creating Question #{idxqs}"

      qs = Question.create({
         order:         idxqs,
         question_text: "Question #{idx}.#{idxqs}",
      }) 
      
      correct = false
      blocker = true

      answers = [true,false,false,false].shuffle
      1.upto(4) do |idxa|
         correct = answers[idxa-1]
         aw = Answer.create({
            order:            idxa,
            answer_text:      "Answer #{idx}.#{idxqs}.#{idxa}",
            correct_answer:   correct
         }) 
         qs.answers << aw
      end

      q.questions << qs
   end

   q.save!
   puts " --- CREATED!"
   puts " ======================== "
end
puts " --- Creating Quiz 'Examen OPE SERMAS 2014'"
arr = YAML.load_file("db/examen.yml")
correct_answers = arr["solved"]
quiz = arr["quiz"]
q = Quiz.create({
   name:          "Examen OPE SERMAS 2014",
   description:   "Concurso oposición de enfermeria de 2014 de la comunidad de madrid",
   quiz_date:     Date.parse("2014-12-15")
})
idxqs = idxa = 1
quiz.each do |data|
   puts " --- === Creating Question #{idxqs}"
   qs = Question.create({
      order:         idxqs,
      question_text: data["question"],
   })
   idxa = 1
   data["answers"].each do |answ|
      correct = (correct_answers[idxqs] == idxa)
      aw = Answer.create({
         order:            idxa,
         answer_text:      answ,
         correct_answer:   correct
      }) 
      idxa += 1
      qs.answers << aw
   end
   q.questions << qs
   idxqs += 1
end
q.save!
puts " --- CREATED!"
puts " ======================== "