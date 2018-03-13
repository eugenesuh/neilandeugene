class AlikesController < ApplicationController

  def create_row
    @alike = Alike.new

    @alike.activity_id = params.fetch("activity_id")
    @alike.user_id = params.fetch("user_id")
      @alike.save

      redirect_to("/activities", :notice => "Alike created successfully.")

  end

  def destroy_row
    @alike = Alike.find(params.fetch("id_to_remove"))

    @alike.destroy

    redirect_to("/activities", :notice => "Alike deleted successfully.")
  end
end
