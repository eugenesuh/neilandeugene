class SlikesController < ApplicationController
  def index
    @slikes = Slike.all

    render("slike_templates/index.html.erb")
  end

  def show
    @slike = Slike.find(params.fetch("id_to_display"))

    render("slike_templates/show.html.erb")
  end

  def new_form
    render("slike_templates/new_form.html.erb")
  end

  def create_row
    @slike = Slike.new

    @slike.user_id = params.fetch("user_id")
    @slike.song_id = params.fetch("song_id")

    if @slike.valid?
      @slike.save

      redirect_to("/slikes", :notice => "Slike created successfully.")
    else
      render("slike_templates/new_form.html.erb")
    end
  end

  def edit_form
    @slike = Slike.find(params.fetch("prefill_with_id"))

    render("slike_templates/edit_form.html.erb")
  end

  def update_row
    @slike = Slike.find(params.fetch("id_to_modify"))

    @slike.user_id = params.fetch("user_id")
    @slike.song_id = params.fetch("song_id")

    if @slike.valid?
      @slike.save

      redirect_to("/slikes/#{@slike.id}", :notice => "Slike updated successfully.")
    else
      render("slike_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @slike = Slike.find(params.fetch("id_to_remove"))

    @slike.destroy

    redirect_to("/slikes", :notice => "Slike deleted successfully.")
  end
end
