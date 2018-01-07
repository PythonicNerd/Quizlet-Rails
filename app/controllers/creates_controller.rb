class CreatesController < ApplicationController
  before_action :generate_set

  def show
    render 'create'
  end

  def generate_set


    #This Try-Catch Statement will be removed in the final version of the app
    begin
      #@set = Rails.application.config.set
      throw Exception
    rescue
      @set = FlashcardSet.new()
      @set.name = "Test Set"

      c1 = Flashcard.new(question: "Uno", answer: "Uno AN")
      c2 = Flashcard.new(question: "Two", answer: "Two AN")
      c3 = Flashcard.new(question: "Tres", answer: "Tres AN")

      @set.update(flashcards: [c1,c2,c3])

      Rails.application.config.set = @set
    end


  end






    def add_new_flashcard_ajax

      question = params[:question]
      answer = params[:answer]

      card = ::Flashcard.new(question: question, answer: answer)
      @set.update(flashcards: [card])

      puts "QUESTION"
      puts question



      respond_to do |format|
          format.json { render json: [question, answer] }
      end


    end

    def update_flashcards
      questions = params[:question_array]
      answers = params[:answer_array]
      name = params[:name]

      set = FlashcardSet.where(name: 'Test Set')
      puts @set.flashcards.length
      puts questions.length

      if questions.length > @set.flashcards.length
        difference = questions.length - @set.flashcards.length

        for i in @set.flashcards.length..questions.length
          card = Flashcard.new()
          card[:question] = questions[i]
          card[:answer] = answers[i]

          if card.question == '' and card.answer == ''
            @set.flashcards.push(card)
          end

        end
      end

      for i in 0..@set.flashcards.length
        begin
        puts @set.flashcards[i][:question]
        puts "^ Flashcards"


        @set.flashcards[i].question = questions[i]
        @set.flashcards[i].answer = answers[i]
      rescue
      end
      end

      @set.name = name

      respond_to do |format|
          format.json { render json: [questions, answers] }
      end


      Rails.application.config.set = @set
    end


    def update_title

      puts "Good Evening!"
    end

end
