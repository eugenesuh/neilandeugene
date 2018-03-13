class PlikesController < ApplicationController
  def create_row
    @plike = Plike.new

    @plike.user_id = params.fetch("user_id")
    @plike.photo_id = params.fetch("photo_id")

   
      @plike.save

      redirect_to("/photos", :notice => "Plike created successfully.")
    
  end

  def destroy_row
    @plike = Plike.find(params.fetch("id_to_remove"))

    @plike.destroy

    redirect_to("/photos", :notice => "Plike deleted successfully.")
  end
end
