Rails.application.routes.draw do
  # devise_for :users
  
  devise_for :users do
  match '/users/sign_out' => 'devise/sessions#destroy'
end

  # Routes for the Guest resource:
  
  root "guests#home"
  
  # CREATE
  get("/guests/new", { :controller => "guests", :action => "new_form" })
  post("/create_guest", { :controller => "guests", :action => "create_row" })

  # READ
  get("/guests", { :controller => "guests", :action => "index" })
  get("/guests/:id_to_display", { :controller => "guests", :action => "show" })

  # UPDATE
  get("/guests/:prefill_with_id/edit", { :controller => "guests", :action => "edit_form" })
  post("/update_guest/:id_to_modify", { :controller => "guests", :action => "update_row" })
  post("/rsvp/:id_to_modify", { :controller => "guests", :action => "rsvp" })

  # DELETE
  get("/delete_guest/:id_to_remove", { :controller => "guests", :action => "destroy_row" })

  #------------------------------
  
  # Routes for the Scomment resource:

  # CREATE
  get("/scomments/new", { :controller => "scomments", :action => "new_form" })
  post("/create_scomment", { :controller => "scomments", :action => "create_row" })

  # READ
  get("/scomments", { :controller => "scomments", :action => "index" })
  get("/scomments/:id_to_display", { :controller => "scomments", :action => "show" })

  # UPDATE
  get("/scomments/:prefill_with_id/edit", { :controller => "scomments", :action => "edit_form" })
  post("/update_scomment/:id_to_modify", { :controller => "scomments", :action => "update_row" })

  # DELETE
  get("/delete_scomment/:id_to_remove", { :controller => "scomments", :action => "destroy_row" })

  #------------------------------

  # Routes for the Slike resource:

  # CREATE
  post("/create_slike", { :controller => "slikes", :action => "create_row" })

  # DELETE
  get("/delete_slike/:id_to_remove", { :controller => "slikes", :action => "destroy_row" })

  #------------------------------

  # Routes for the Song resource:

  # CREATE
  get("/songs/new", { :controller => "songs", :action => "new_form" })
  post("/create_song", { :controller => "songs", :action => "create_row" })

  # READ
  get("/songs", { :controller => "songs", :action => "index" })
  get("/songs/:id_to_display", { :controller => "songs", :action => "show" })

  # UPDATE
  get("/songs/:prefill_with_id/edit", { :controller => "songs", :action => "edit_form" })
  post("/update_song/:id_to_modify", { :controller => "songs", :action => "update_row" })

  # DELETE
  get("/delete_song/:id_to_remove", { :controller => "songs", :action => "destroy_row" })

  #------------------------------
  
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
