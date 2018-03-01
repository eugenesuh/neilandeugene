class GuestsController < ApplicationController
  def index
    @guests = Guest.all

    render("guest_templates/index.html.erb")
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
    @guest.status = params.fetch("status")
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

  def edit_form
    @guest = Guest.find(params.fetch("prefill_with_id"))

    render("guest_templates/edit_form.html.erb")
  end

  def update_row
    @guest = Guest.find(params.fetch("id_to_modify"))

    @guest.user_id = params.fetch("user_id")
    @guest.age = params.fetch("age")
    @guest.status = params.fetch("status")
    @guest.food = params.fetch("food")
    @guest.lastname = params.fetch("lastname")
    @guest.firstname = params.fetch("firstname")
    @guest.dietary = params.fetch("dietary")
    @guest.image = params.fetch("image")

    if @guest.valid?
      @guest.save

      redirect_to("/guests/#{@guest.id}", :notice => "Guest updated successfully.")
    else
      render("guest_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @guest = Guest.find(params.fetch("id_to_remove"))

    @guest.destroy

    redirect_to("/guests", :notice => "Guest deleted successfully.")
  end
end
