class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all

    render("activity_templates/index.html.erb")
  end

  def show
    @activity = Activity.find(params.fetch("id_to_display"))
    @dest = @activity.keyword
    url_dest = URI.encode(@dest)
    @key = url_dest
    render("activity_templates/show.html.erb")
  end

  def new_form
    render("activity_templates/new_form.html.erb")
  end

  def create_row
    @activity = Activity.new

    @activity.name = params.fetch("name")
    @activity.description = params.fetch("description")
    @activity.user_id = params.fetch("user_id")
    @activity.image = params.fetch("image")
    @activity.keyword = params.fetch("keyword")

    
    #Google API
    @dest = @activity.keyword
    url_dest = URI.encode(@dest)
    url = "https://maps.googleapis.com/maps/api/distancematrix/json?origins=Arizona+Biltmore&destinations=#{url_dest}&key=AIzaSyAxd59siwkbm0X3i1P62hXmfTuWXUZkvek"

    parsed_data = JSON.parse(open(url).read)
    @activity.duration = parsed_data.dig("rows", 0, "elements",0, "duration", "text")
    @activity.distance = parsed_data.dig("rows", 0, "elements",0, "distance", "text")
    @destination = parsed_data.dig("destination_addresses")
    
    @activity.save
      
      redirect_to("/activities", :notice => "Activity created successfully.")
  end

  def edit_form
    @activity = Activity.find(params.fetch("prefill_with_id"))

    render("activity_templates/edit_form.html.erb")
  end

  def update_row
    @activity = Activity.find(params.fetch("id_to_modify"))

    @activity.name = params.fetch("name")
    @activity.description = params.fetch("description")
    @activity.user_id = params.fetch("user_id")
    @activity.image = params.fetch("image")
    @activity.keyword = params.fetch("keyword")
    
    #Google API
    @dest = @activity.keyword
    url_dest = URI.encode(@dest)
    url = "https://maps.googleapis.com/maps/api/distancematrix/json?origins=Arizona+Biltmore&destinations=#{url_dest}&key=AIzaSyAxd59siwkbm0X3i1P62hXmfTuWXUZkvek"

    parsed_data = JSON.parse(open(url).read)
    @activity.duration = parsed_data.dig("rows", 0, "elements",0, "duration", "text")
    @activity.distance = parsed_data.dig("rows", 0, "elements",0, "distance", "text")
    @destination = parsed_data.dig("destination_addresses")
    

    @activity.save

    redirect_to("/activities/#{@activity.id}", :notice => "Activity updated successfully.")
    
  end

  def destroy_row
    @activity = Activity.find(params.fetch("id_to_remove"))

    @activity.destroy

    redirect_to("/activities", :notice => "Activity deleted successfully.")
  end
  
end
