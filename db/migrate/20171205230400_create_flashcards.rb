class CreateFlashcards < ActiveRecord::Migration[5.1]
  def change
    create_table :flashcards do |t|
      t.string :question
      t.text :answer

      t.belongs_to :flascard_set, index: true


      t.timestamps
    end
  end
end
