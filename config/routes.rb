Rails.application.routes.draw do
  # Routes for the Activity resource:

  # CREATE
  get("/activities/new", { :controller => "activities", :action => "new_form" })
  post("/create_activity", { :controller => "activities", :action => "create_row" })

  # READ
  get("/activities", { :controller => "activities", :action => "index" })
  get("/activities/:id_to_display", { :controller => "activities", :action => "show" })

  # UPDATE
  get("/activities/:prefill_with_id/edit", { :controller => "activities", :action => "edit_form" })
  post("/update_activity/:id_to_modify", { :controller => "activities", :action => "update_row" })

  # DELETE
  get("/delete_activity/:id_to_remove", { :controller => "activities", :action => "destroy_row" })

  #------------------------------

  # Routes for the Alike resource:

  # CREATE
  get("/alikes/new", { :controller => "alikes", :action => "new_form" })
  post("/create_alike", { :controller => "alikes", :action => "create_row" })

  # READ
  get("/alikes", { :controller => "alikes", :action => "index" })
  get("/alikes/:id_to_display", { :controller => "alikes", :action => "show" })

  # UPDATE
  get("/alikes/:prefill_with_id/edit", { :controller => "alikes", :action => "edit_form" })
  post("/update_alike/:id_to_modify", { :controller => "alikes", :action => "update_row" })

  # DELETE
  get("/delete_alike/:id_to_remove", { :controller => "alikes", :action => "destroy_row" })

  #------------------------------

  # Routes for the Acomment resource:

  # CREATE
  get("/acomments/new", { :controller => "acomments", :action => "new_form" })
  post("/create_acomment", { :controller => "acomments", :action => "create_row" })

  # READ
  get("/acomments", { :controller => "acomments", :action => "index" })
  get("/acomments/:id_to_display", { :controller => "acomments", :action => "show" })

  # UPDATE
  get("/acomments/:prefill_with_id/edit", { :controller => "acomments", :action => "edit_form" })
  post("/update_acomment/:id_to_modify", { :controller => "acomments", :action => "update_row" })

  # DELETE
  get("/delete_acomment/:id_to_remove", { :controller => "acomments", :action => "destroy_row" })

  #------------------------------

  # Routes for the Rsvp resource:

  # CREATE
  post("/create_rsvp", { :controller => "guests", :action => "rsvp_new" })

  # UPDATE
  post("/update_rsvp", { :controller => "guests", :action => "rsvp_update" })

  # DELETE
  get("/delete_rsvp/:id_to_remove", { :controller => "rsvps", :action => "destroy_row" })

  #------------------------------

  # Routes for the Pcomment resource:

  # CREATE
  get("/pcomments/new", { :controller => "pcomments", :action => "new_form" })
  post("/create_pcomment", { :controller => "pcomments", :action => "create_row" })

  # READ
  get("/pcomments", { :controller => "pcomments", :action => "index" })
  get("/pcomments/:id_to_display", { :controller => "pcomments", :action => "show" })

  # UPDATE
  get("/pcomments/:prefill_with_id/edit", { :controller => "pcomments", :action => "edit_form" })
  post("/update_pcomment/:id_to_modify", { :controller => "pcomments", :action => "update_row" })

  # DELETE
  get("/delete_pcomment/:id_to_remove", { :controller => "pcomments", :action => "destroy_row" })

  #------------------------------

  # Routes for the Plike resource:

  # CREATE
  get("/plikes/new", { :controller => "plikes", :action => "new_form" })
  post("/create_plike", { :controller => "plikes", :action => "create_row" })

  # READ
  get("/plikes", { :controller => "plikes", :action => "index" })
  get("/plikes/:id_to_display", { :controller => "plikes", :action => "show" })

  # UPDATE
  get("/plikes/:prefill_with_id/edit", { :controller => "plikes", :action => "edit_form" })
  post("/update_plike/:id_to_modify", { :controller => "plikes", :action => "update_row" })

  # DELETE
  get("/delete_plike/:id_to_remove", { :controller => "plikes", :action => "destroy_row" })

  #------------------------------

  # Routes for the Photo resource:

  # CREATE
  get("/photos/new", { :controller => "photos", :action => "new_form" })
  post("/create_photo", { :controller => "photos", :action => "create_row" })

  # READ
  get("/photos", { :controller => "photos", :action => "index" })
  get("/photos/:id_to_display", { :controller => "photos", :action => "show" })

  # UPDATE
  get("/photos/:prefill_with_id/edit", { :controller => "photos", :action => "edit_form" })
  post("/update_photo/:id_to_modify", { :controller => "photos", :action => "update_row" })

  # DELETE
  get("/delete_photo/:id_to_remove", { :controller => "photos", :action => "destroy_row" })

  #------------------------------

  #devise_for :users
  devise_for :users, controllers: { registrations: 'registrations' }
  
  # Routes for the Guest resource:
  
  root "guests#home"
  get("/family", { :controller => "guests", :action => "family" })

  
  # CREATE
  get("/guests/new", { :controller => "guests", :action => "new_form" })
  post("/create_guest", { :controller => "guests", :action => "create_row" })

  # READ
  get("/guests", { :controller => "guests", :action => "index" })
  get("/guests/likes", { :controller => "guests", :action => "likes" })

  get("/guests/:id_to_display", { :controller => "guests", :action => "show" })

  # UPDATE
  get("/guests/:prefill_with_id/edit", { :controller => "guests", :action => "edit_form" })
  post("/update_guest/:id_to_modify", { :controller => "guests", :action => "update_row" })

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
