class CreatesController < ApplicationController
  before_action :generate_set

  def show



    render 'create'
  end

  def generate_set
    @set = ::FlashcardSet.new()
    @set.name = "Test Set"

    c1 = ::Flashcard.new(question: "Uno", answer: "Uno AN")
    c2 = ::Flashcard.new(question: "Two", answer: "Two AN")
    c3 = ::Flashcard.new(question: "Tres", answer: "Tres AN")

    @set.update(flashcards: [c1,c2,c3])

    puts @set
    puts "SET ^"
    @set.save
  end



    def add_new_flashcard(question, answer)
      set = ::FlashcardSet.where(name: 'Test Set')
      card = ::Flashcard.new(question: question, answer: answer)
      set.update(flashcards: [card])
    end


    def add_new_flashcard_ajax

      question = params[:question]
      answer = params[:answer]

      add_new_flashcard(question, answer)

      puts "QUESTION"
      puts question



      respond_to do |format|
          format.json { render json: [question, answer] }
      end


    end

end
