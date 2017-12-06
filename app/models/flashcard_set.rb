class FlashcardSet < ApplicationRecord

  has_many :flashcards, dependent: :destroy
  belongs_to :user
end
