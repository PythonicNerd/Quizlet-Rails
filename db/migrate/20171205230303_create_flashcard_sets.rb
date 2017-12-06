class CreateFlashcardSets < ActiveRecord::Migration[5.1]
  def change
    create_table :flashcard_sets do |t|
      t.string :name
      t.text :desc

      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
