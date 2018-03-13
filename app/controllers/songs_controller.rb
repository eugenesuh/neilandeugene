class SongsController < ApplicationController
  def index
    @songs = Song.all

    render("song_templates/index.html.erb")
  end

  def show
    @song = Song.find(params.fetch("id_to_display"))

    render("song_templates/show.html.erb")
  end

  def new_form
    render("song_templates/new_form.html.erb")
  end

  def create_row
    @song = Song.new

    @song.title = params.fetch("title")
    @song.artist = params.fetch("artist")
    @song.user_id = params.fetch("user_id")


    if @song.valid?
      @song.save

      redirect_to("/songs", :notice => "Song created successfully.")
    else
      render("song_templates/new_form.html.erb")
    end
  end

  def edit_form
    @song = Song.find(params.fetch("prefill_with_id"))

    render("song_templates/edit_form.html.erb")
  end

  def update_row
    @song = Song.find(params.fetch("id_to_modify"))

    @song.title = params.fetch("title")
    @song.artist = params.fetch("artist")
    @song.user_id = params.fetch("user_id")

    if @song.valid?
      @song.save

      redirect_to("/songs/#{@song.id}", :notice => "Song updated successfully.")
    else
      render("song_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @song = Song.find(params.fetch("id_to_remove"))

    @song.destroy

    redirect_to("/songs", :notice => "Song deleted successfully.")
  end
end
