class PcommentsController < ApplicationController
  def index
    @pcomments = Pcomment.all

    render("pcomment_templates/index.html.erb")
  end

  def show
    @pcomment = Pcomment.find(params.fetch("id_to_display"))

    render("pcomment_templates/show.html.erb")
  end

  def new_form
    render("pcomment_templates/new_form.html.erb")
  end

  def create_row
    @pcomment = Pcomment.new

    @pcomment.user_id = params.fetch("user_id")
    @pcomment.photo_id = params.fetch("photo_id")
    @pcomment.body = params.fetch("body")

    if @pcomment.valid?
      @pcomment.save

      redirect_to("/pcomments", :notice => "Pcomment created successfully.")
    else
      render("pcomment_templates/new_form.html.erb")
    end
  end

  def edit_form
    @pcomment = Pcomment.find(params.fetch("prefill_with_id"))

    render("pcomment_templates/edit_form.html.erb")
  end

  def update_row
    @pcomment = Pcomment.find(params.fetch("id_to_modify"))

    @pcomment.user_id = params.fetch("user_id")
    @pcomment.photo_id = params.fetch("photo_id")
    @pcomment.body = params.fetch("body")

    if @pcomment.valid?
      @pcomment.save

      redirect_to("/pcomments/#{@pcomment.id}", :notice => "Pcomment updated successfully.")
    else
      render("pcomment_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @pcomment = Pcomment.find(params.fetch("id_to_remove"))

    @pcomment.destroy

    redirect_to("/pcomments", :notice => "Pcomment deleted successfully.")
  end
end
