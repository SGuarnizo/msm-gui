class ActorsController < ApplicationController
  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
      
    render({ :template => "actor_templates/show" })
  end

  def insert
    @a = Actor.new
    @a.name = params.fetch("actor_name_param")
    @a.dob = params.fetch("actor_dob_param")
    @a.bio = params.fetch("actor_bio_param")
    @a.image = params.fetch("actor_image_param")
    @a.save

    redirect_to("/actors")
  end

  def update
    the_id = params.fetch("actor_id")
    matching_actors = Actor.where({ :id => the_id })
    @a = matching_actors.at(0)
    @a.name = params.fetch("aupdate_name_param")
    @a.dob = params.fetch("aupdate_dob_param")
    @a.bio = params.fetch("aupdate_bio_param")
    @a.image = params.fetch("aupdate_image_param")
    @a.save

    redirect_to("/actors/#{@a.id}")
  end

  def delete
    the_id = params.fetch("act_id")
    matching_actors = Actor.where({ :id => the_id })
    @a= matching_actors.at(0)
    @a.destroy

    redirect_to("/actors")
  end

end
