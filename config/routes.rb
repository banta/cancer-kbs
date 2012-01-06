CancerKbs::Application.routes.draw do
  resources :cancer_symptoms

  get "cancer_diagnosis/diagnose"
  post "cancer_diagnosis/diagnose"

  get "cancer_diagnosis/results"
  post "cancer_diagnosis/results"
  get "cancer_diagnosis/full_report"

  post "cancer_types/create_cs"
  get "cancer_types/remove_cs"

  resources :cancer_types

  devise_for :users

  root :to => 'cancer_types#index'

end
