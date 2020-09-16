class AddQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :body
    end
    create_table :entries do |t|
      t.string :email
    end
    create_table :answers do |t|
      t.string :body
      t.integer :question_id
      t.integer :entry_id
    end
  end
end
