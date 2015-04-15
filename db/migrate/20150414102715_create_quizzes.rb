class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.string   :name
      t.text     :description
      t.date     :quiz_date

      t.timestamps
    end
  end
end
