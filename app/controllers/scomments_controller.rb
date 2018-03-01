class ScommentsController < ApplicationController
  def index
    @scomments = Scomment.all

    render("scomment_templates/index.html.erb")
  end

  def show
    @scomment = Scomment.find(params.fetch("id_to_display"))

    render("scomment_templates/show.html.erb")
  end

  def new_form
    render("scomment_templates/new_form.html.erb")
  end

  def create_row
    @scomment = Scomment.new

    @scomment.user_id = params.fetch("user_id")
    @scomment.song_id = params.fetch("song_id")
    @scomment.body = params.fetch("body")

    if @scomment.valid?
      @scomment.save

      redirect_to("/scomments", :notice => "Scomment created successfully.")
    else
      render("scomment_templates/new_form.html.erb")
    end
  end

  def edit_form
    @scomment = Scomment.find(params.fetch("prefill_with_id"))

    render("scomment_templates/edit_form.html.erb")
  end

  def update_row
    @scomment = Scomment.find(params.fetch("id_to_modify"))

    @scomment.user_id = params.fetch("user_id")
    @scomment.song_id = params.fetch("song_id")
    @scomment.body = params.fetch("body")

    if @scomment.valid?
      @scomment.save

      redirect_to("/scomments/#{@scomment.id}", :notice => "Scomment updated successfully.")
    else
      render("scomment_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @scomment = Scomment.find(params.fetch("id_to_remove"))

    @scomment.destroy

    redirect_to("/scomments", :notice => "Scomment deleted successfully.")
  end
end
