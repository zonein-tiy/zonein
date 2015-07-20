Rails.application.routes.draw do
  patch 'plans/workout_completion', to: 'plans#update_workout_completion'
  patch 'plans/completion', to: 'plans#update_completion'
  get 'plans/adopted', to: 'plans#index_adopted'
  get 'plans/creator', to: 'plans#index_creator'
  patch 'plans/workouts', to: 'plans#update_completion'
  post 'plans/workouts', to: 'plans#add_workout'
  post 'athletes/signin', to: 'athletes#signin'
  post 'athletes/signup', to: 'athletes#signup'
  patch 'athletes/register', to: 'athletes#register'
  resources :teams
  resources :athletes
  resources :plans
  resources :workouts, except: [:show]
  post 'workouts/category', to: 'workouts#index_category'
  post 'workouts/description', to: 'workouts#index_description'
  get 'workouts/athlete', to: 'workouts#index_create'

  # resources :athletes do
  #   resources :plans, only: [:index, :new, :create]
  # end

  # # resources :plans, only: [:show, :edit, :update, :destroy]

  # get 'teams', to: 'teams#index'
  # get 'team/:team_id', to: 'teams#show'
  # get 'teams/new,', to: 'teams#new'
  # post 'teams', to: 'teams#create'
  # get 'team/:team_id/edit', to: 'teams#edit'
  # patch 'team/:team_id', to: 'teams#update'
  # delete 'team/team_id', to: 'teams#destroy'

  # get 'team/:team_id/athletes', to: 'teams#players'
  # get 'team/:team_id/athlete/:athlete_id/plans', to: 'teams#playerplans'
  # get 'team/:team_id/athlete/:athlete_id/plan/:plan_id/workouts' to: 'teams#playerplanworkouts'

  # . . .

  # get 'athlete/:athlete_id', to: 'athletes#show'
  # get 'athlete/:athlete_id/edit', to: 'teams#edit'
  # patch 'team/:team_id', to: 'teams#update'
  # delete 'team/team_id', to: 'teams#destroy'


#         Prefix Verb   URI Pattern                  Controller#Action
#     athletes GET    /athletes(.:format)          athletes#index
#              POST   /athletes(.:format)          athletes#create
#  new_athlete GET    /athletes/new(.:format)      athletes#new
# edit_athlete GET    /athletes/:id/edit(.:format) athletes#edit
#      athlete GET    /athletes/:id(.:format)      athletes#show
#              PATCH  /athletes/:id(.:format)      athletes#update
#              PUT    /athletes/:id(.:format)      athletes#update
#              DELETE /athletes/:id(.:format)      athletes#destroy

  # get 'athletes/index'

  # get 'athletes/show'

  # get 'athletes/new'

  # get 'athletes/create'

  # get 'athletes/edit'

  # get 'athletes/update'

  # get 'athletes/destroy'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
