class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer      :order
      t.text         :question_text

      t.references   :quiz
      t.timestamps
    end
  end
end
