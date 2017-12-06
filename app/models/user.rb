class User < ApplicationRecord

  has_many :flashcard_sets, dependent: :destroy
  has_many :flashcards, though: :flashcard_sets
end
