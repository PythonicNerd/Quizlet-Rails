class User < ApplicationRecord

  has_many :flashcard_sets, dependent: :destroy

end
