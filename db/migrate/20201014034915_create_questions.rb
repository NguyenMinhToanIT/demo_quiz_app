class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :question_no
      t.text :question
      t.text :opt1
      t.text :opt2
      t.text :opt3
      t.text :opt4
      t.text :answer
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
