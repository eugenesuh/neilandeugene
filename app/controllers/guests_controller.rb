class GuestsController < ApplicationController
  def index
    @guests = Guest.all
    @myguests = current_user.guests

    render("guest_templates/index.html.erb")
  end

  def likes
    @user = current_user
    @plikes = Plike.where(:user_id => @user.id)
    @slikes = Slike.where(:user_id => @user.id)
    @alikes = Alike.where(:user_id => @user.id)

    render("guest_templates/likes.html.erb")
  end

  def show
    @guest = Guest.find(params.fetch("id_to_display"))

    render("guest_templates/show.html.erb")
  end

  def new_form
    render("guest_templates/new_form.html.erb")
  end

  def create_row
    @guest = Guest.new

    @guest.user_id = params.fetch("user_id")
    @guest.age = params.fetch("age")
    @guest.food = params.fetch("food")
    @guest.lastname = params.fetch("lastname")
    @guest.firstname = params.fetch("firstname")
    @guest.dietary = params.fetch("dietary")
    @guest.image = params.fetch("image")

    if @guest.valid?
      @guest.save

      redirect_to("/guests", :notice => "Guest created successfully.")
    else
      render("guest_templates/new_form.html.erb")
    end
  end
  
  def home
    @users = User.all
    @rsvps = Rsvp.all
    @guests = Guest.all

    render("layouts/home.html.erb")
  end
  
  def family
    @users = User.all
    @rsvps = Rsvp.all

    render("layouts/family.html.erb")
  end

  def edit_form
    @guest = Guest.find(params.fetch("prefill_with_id"))

    render("guest_templates/edit_form.html.erb")
  end

  def update_row
    @guest = Guest.find(params.fetch("id_to_modify"))

    @guest.user_id = params.fetch("user_id")
    @guest.age = params.fetch("age")
    @guest.food = params.fetch("food")
    @guest.lastname = params.fetch("lastname")
    @guest.firstname = params.fetch("firstname")
    @guest.dietary = params.fetch("dietary")
    @guest.image = params.fetch("image")

    if @guest.valid?
      @guest.save

      redirect_to("/guests", :notice => "Guest updated successfully.")
    else
      render("guest_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @guest = Guest.find(params.fetch("id_to_remove"))

    @guest.destroy

    redirect_to("/guests", :notice => "Guest deleted successfully.")
  end
  
    def rsvp_new
    @rsvp = Rsvp.new

    @rsvp.user_id = params.fetch("user_id")
    @rsvp.status = params.fetch("status")
    @rsvp.save

    redirect_to("/guests", :notice => "Rsvp created successfully.")
  end


  def rsvp_update
    @rsvp = Rsvp.find_by(user_id: current_user.id)

    @rsvp.user_id = current_user.id    
    @rsvp.status = params.fetch("status")
    @rsvp.save

      redirect_to("/guests", :notice => "Rsvp updated successfully.")
    
  end
end
