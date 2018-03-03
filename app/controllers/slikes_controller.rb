class SlikesController < ApplicationController

  def create_row
    @slike = Slike.new

    @slike.user_id = params.fetch("user_id")
    @slike.song_id = params.fetch("song_id")
    
    @slike.save
    
    redirect_to("/songs", :notice => "You liked a song")
    
  end
  
  

  def destroy_row
    @slike = Slike.find(params.fetch("id_to_remove"))
    @slike.destroy
    redirect_to("/songs", :notice => "You unliked a song")
  end
end
