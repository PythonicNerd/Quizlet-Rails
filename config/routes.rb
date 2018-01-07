Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "miscs#home"

  resource :registrations
  resource :logins
  resource :miscs
  resource :creates

  get 'create' =>  'creates#create'

  post 'creates/add_new_flashcard_ajax' => 'creates#add_new_flashcard_ajax'

  get 'creates/update_flashcards' => 'creates#update_flashcards'

  get 'creates/update_title' => 'creates#update_title'


end
