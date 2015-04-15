class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer      :order
      t.text         :answer_text
      t.boolean      :correct_answer

      t.references   :question 
      t.timestamps
    end
  end
end
