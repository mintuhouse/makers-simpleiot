# == Route Map
#
#                   Prefix Verb   URI Pattern                        Controller#Action
#              admin_users GET    /admin/users(.:format)             admin/users#index
#                          POST   /admin/users(.:format)             admin/users#create
#           new_admin_user GET    /admin/users/new(.:format)         admin/users#new
#          edit_admin_user GET    /admin/users/:id/edit(.:format)    admin/users#edit
#               admin_user GET    /admin/users/:id(.:format)         admin/users#show
#                          PATCH  /admin/users/:id(.:format)         admin/users#update
#                          PUT    /admin/users/:id(.:format)         admin/users#update
#                          DELETE /admin/users/:id(.:format)         admin/users#destroy
#               admin_root GET    /admin(.:format)                   admin/users#index
#                     root GET    /                                  visitors#index
#         new_user_session GET    /users/sign_in(.:format)           devise/sessions#new
#             user_session POST   /users/sign_in(.:format)           devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)          devise/sessions#destroy
#        new_user_password GET    /users/password/new(.:format)      devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)     devise/passwords#edit
#            user_password PATCH  /users/password(.:format)          devise/passwords#update
#                          PUT    /users/password(.:format)          devise/passwords#update
#                          POST   /users/password(.:format)          devise/passwords#create
# cancel_user_registration GET    /users/cancel(.:format)            devise_invitable/registrations#cancel
#    new_user_registration GET    /users/sign_up(.:format)           devise_invitable/registrations#new
#   edit_user_registration GET    /users/edit(.:format)              devise_invitable/registrations#edit
#        user_registration PATCH  /users(.:format)                   devise_invitable/registrations#update
#                          PUT    /users(.:format)                   devise_invitable/registrations#update
#                          DELETE /users(.:format)                   devise_invitable/registrations#destroy
#                          POST   /users(.:format)                   devise_invitable/registrations#create
#    new_user_confirmation GET    /users/confirmation/new(.:format)  devise/confirmations#new
#        user_confirmation GET    /users/confirmation(.:format)      devise/confirmations#show
#                          POST   /users/confirmation(.:format)      devise/confirmations#create
#   accept_user_invitation GET    /users/invitation/accept(.:format) devise/invitations#edit
#   remove_user_invitation GET    /users/invitation/remove(.:format) devise/invitations#destroy
#      new_user_invitation GET    /users/invitation/new(.:format)    devise/invitations#new
#          user_invitation PATCH  /users/invitation(.:format)        devise/invitations#update
#                          PUT    /users/invitation(.:format)        devise/invitations#update
#                          POST   /users/invitation(.:format)        devise/invitations#create
#        letter_opener_web        /letter_opener                     LetterOpenerWeb::Engine
#
# Routes for LetterOpenerWeb::Engine:
# clear_letters DELETE /clear(.:format)                 letter_opener_web/letters#clear
# delete_letter DELETE /:id(.:format)                   letter_opener_web/letters#destroy
#       letters GET    /                                letter_opener_web/letters#index
#        letter GET    /:id(/:style)(.:format)          letter_opener_web/letters#show
#               GET    /:id/attachments/:file(.:format) letter_opener_web/letters#attachment
#

Rails.application.routes.draw do
  namespace :admin do
    resources :users

    root to: "users#index"
  end

  root to: 'visitors#index'
  devise_for :users  
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
