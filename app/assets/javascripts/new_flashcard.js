$(document).ready(function(){

  $('#submit_button').click(function(){

    question = $('#question-form').val();
    answer = $('#answer-form').val();

    event.preventDefault();
    $.ajax({
      url: '/creates/add_new_flashcard_ajax',
      type:'POST',
      dataType:'JSON',
      data : { question: question, answer: answer.val},
      error: function (xhr, ajaxOptions, thrownError) {
           alert(xhr.responseText);
       },

      success: function(){

        var question_DOM = document.createElement("p");
        var answer_DOM = document.createElement("p");
        var question_input = document.createElement('input');
        var answer_input = document.createElement('input');

        var answer_box = document.createElement('div');

        answer_box.style.width = '200px'

        answer_box.style.border = '2px solid black'

        answer_box.classList.add('flashcard_box');



        question_input.value = question
        answer_input.value = answer

        question_DOM.classList.add('question');
        answer_DOM.classList.add('answer');

        question_DOM.appendChild(question_input)
        answer_DOM.appendChild(answer_input)


        $('.flashcard_box').last().after(answer_box)

        // $('.flashcard_box').last().after(question_DOM)

        $('.flashcard_box').last().append((question_DOM))

        $('.question').last().after(answer_DOM)
       // $('.question').last().after(answer_DOM)
       $('.flashcard_box').last().before(document.createElement('br'))



      }
      })

  })


  $('#submit').click(function(){

    q_array = []
    a_array = []



    for(var i = 0; i < $('.question').length; i++){
      var value = $('.question').children()[i].value
      q_array.push(value);
    }

    for(var i = 0; i < $('.answer').length; i++){
      var value = $('.answer').children()[i].value
      console.log(value)
      console.log("^ Value")
      a_array.push(value);
    }

    var name = $('#name')[0].value

    console.log(name)

    $.ajax({
      url: '/creates/update_flashcards',
      type: 'GET',
      dataType: 'JSON',
      data: {question_array: q_array, answer_array: a_array, name: name},

      error: function(xhr){
        alert(xhr.responseText)
      },

      success: function(data){
        console.log("Success")
      }

    })

    console.log($('#title_header')[0])
    $('#title_header').text(name)

  })
  })
