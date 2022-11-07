Rails.application.routes.draw do
  root "authors#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :authors do 
    
    get 'author_index', to: 'authors#author_index', on: :collection
    delete 'destroy', to: 'authors#destroy'
     
    get 'book_index', to: 'authors#book_index', on: :collection
    get 'book_new', to: 'authors#book_new', on: :collection 
    post 'book_create', to:'authors#book_create', on: :collection
    get 'book_edit', to:'authors#book_edit', on: :member
    put 'book_update', to:'authors#book_update', on: :member
    delete 'book_destroy', to:'authors#book_destroy', on: :member

    get 'supplier_index', to: 'authors#supplier_index', on: :collection
    get 'supplier_new', to: 'authors#supplier_new', on: :collection
    post 'supplier_create', to: 'authors#supplier_create', on: :collection
    get 'supplier_edit', to: 'authors#supplier_edit', on: :member
    put 'supplier_update', to: 'authors#supplier_update', on: :member
    delete 'supplier_destroy', to: 'authors#supplier_destroy', on: :member

    get 'account_index', to: 'authors#account_index', on: :collection
    get 'account_new', to: 'authors#account_new', on: :collection
    post 'account_create', to: 'authors#account_create', on: :collection
    get 'account_edit', to: 'authors#account_edit', on: :member
    put 'account_update', to: 'authors#account_update', on: :member
    delete 'account_destroy', to: 'authors#account_destroy', on: :member

  end
end