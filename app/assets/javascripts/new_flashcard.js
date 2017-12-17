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
           //alert("Oops! Something went wrong! Please try again.")
       },

      success: function(data){

        var question_DOM = document.createElement("p");
        var answer_DOM = document.createElement("p");

        question_DOM.innerHTML = question
        answer_DOM.innerHTML = answer

        question_DOM.classList.add('question');
        answer_DOM.classList.add('answer');

        console.log(question_DOM);

        $('.answer').last().append(document.createElement('br'))
        $('.answer').last().append(question_DOM)
        $('.question').last().append(answer_DOM)


      }
      })

  })
  })
