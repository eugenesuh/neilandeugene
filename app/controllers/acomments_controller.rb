class AcommentsController < ApplicationController
  def create_row
    @acomment = Acomment.new

    @acomment.user_id = params.fetch("user_id")
    @acomment.activity_id = params.fetch("activity_id")
    @acomment.body = params.fetch("body")
    @acomment.save

   redirect_to("/activities", :notice => "Acomment created successfully.")
  end

  def destroy_row
    @acomment = Acomment.find(params.fetch("id_to_remove"))
    @acomment.destroy

    redirect_to("/activities", :notice => "Acomment deleted successfully.")
  
  end
  
end
