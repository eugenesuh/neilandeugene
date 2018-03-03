class PlikesController < ApplicationController
  def index
    @plikes = Plike.all

    render("plike_templates/index.html.erb")
  end

  def show
    @plike = Plike.find(params.fetch("id_to_display"))

    render("plike_templates/show.html.erb")
  end

  def new_form
    render("plike_templates/new_form.html.erb")
  end

  def create_row
    @plike = Plike.new

    @plike.user_id = params.fetch("user_id")
    @plike.photo_id = params.fetch("photo_id")

    if @plike.valid?
      @plike.save

      redirect_to("/plikes", :notice => "Plike created successfully.")
    else
      render("plike_templates/new_form.html.erb")
    end
  end

  def edit_form
    @plike = Plike.find(params.fetch("prefill_with_id"))

    render("plike_templates/edit_form.html.erb")
  end

  def update_row
    @plike = Plike.find(params.fetch("id_to_modify"))

    @plike.user_id = params.fetch("user_id")
    @plike.photo_id = params.fetch("photo_id")

    if @plike.valid?
      @plike.save

      redirect_to("/plikes/#{@plike.id}", :notice => "Plike updated successfully.")
    else
      render("plike_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @plike = Plike.find(params.fetch("id_to_remove"))

    @plike.destroy

    redirect_to("/plikes", :notice => "Plike deleted successfully.")
  end
end
