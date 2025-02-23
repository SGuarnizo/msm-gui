class DirectorsController < ApplicationController
  def index
    matching_directors = Director.all
    @list_of_directors = matching_directors.order({ :created_at => :desc })

    render({ :template => "director_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_directors = Director.where({ :id => the_id })
    @the_director = matching_directors.at(0)

    render({ :template => "director_templates/show" })
  end

  def max_dob
    directors_by_dob_desc = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :desc })

    @youngest = directors_by_dob_desc.at(0)

    render({ :template => "director_templates/youngest" })
  end

  def min_dob
    directors_by_dob_asc = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :asc })
      
    @eldest = directors_by_dob_asc.at(0)

    render({ :template => "director_templates/eldest" })
  end

  def insert
    @d = Director.new
    @d.name = params.fetch("director_name_param")
    @d.dob = params.fetch("director_dob_param")
    @d.bio = params.fetch("director_bio_param")
    @d.image = params.fetch("director_image_param")
    @d.save

    redirect_to("/directors")
  end

  def update
    the_id = params.fetch("director_id")
    matching_directors = Director.where({ :id => the_id })
    @d = matching_directors.at(0)
    @d.name = params.fetch("dupdate_name_param")
    @d.dob = params.fetch("dupdate_dob_param")
    @d.bio = params.fetch("dupdate_bio_param")
    @d.image = params.fetch("dupdate_image_param")
    @d.save

    redirect_to("/directors/#{@d.id}")
  end

  def delete
    the_id = params.fetch("dir_id")
    matching_directors = Director.where({ :id => the_id })
    @d= matching_directors.at(0)
    @d.destroy

    redirect_to("/directors")
  end

end
