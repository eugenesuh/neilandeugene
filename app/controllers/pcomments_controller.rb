class PcommentsController < ApplicationController
  def create_row
    @pcomment = Pcomment.new

    @pcomment.user_id = params.fetch("user_id")
    @pcomment.photo_id = params.fetch("photo_id")
    @pcomment.body = params.fetch("body")

      @pcomment.save

      redirect_to("/photos", :notice => "Pcomment created successfully.")
  end

  def destroy_row
    @pcomment = Pcomment.find(params.fetch("id_to_remove"))

    @pcomment.destroy

    redirect_to("/photos", :notice => "Pcomment deleted successfully.")
  end
end
