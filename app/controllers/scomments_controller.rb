class ScommentsController < ApplicationController

  def create_row
    @scomment = Scomment.new

    @scomment.user_id = params.fetch("user_id")
    @scomment.song_id = params.fetch("song_id")
    @scomment.body = params.fetch("body")

      @scomment.save

      redirect_to("/songs", :notice => "Scomment created successfully.")
  end


  def destroy_row
    @scomment = Scomment.find(params.fetch("id_to_remove"))

    @scomment.destroy

    redirect_to("/songs", :notice => "Scomment deleted successfully.")
  end
end
