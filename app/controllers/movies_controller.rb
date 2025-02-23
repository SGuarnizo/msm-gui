class MoviesController < ApplicationController
  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end

  def insert
    @m = Movie.new
    @m.title = params.fetch("movie_title_param")
    @m.year = params.fetch("movie_year_param")
    @m.duration = params.fetch("movie_duration_param")
    @m.description = params.fetch("movie_description_param")
    @m.image = params.fetch("movie_image_param")
    @m.director_id = params.fetch("movie_director_param")
    @m.save

    redirect_to("/movies")
  end

  def update
    the_id = params.fetch("movie_id")
    matching_movie = Movie.where({ :id => the_id })
    @m = matching_movie.at(0)
    @m.title = params.fetch("mupdate_title_param")
    @m.year = params.fetch("mupdate_year_param")
    @m.duration = params.fetch("mupdate_duration_param")
    @m.description = params.fetch("mupdate_description_param")
    @m.image = params.fetch("mupdate_image_param")
    @m.director_id = params.fetch("mupdate_director_param")
    @m.save

    redirect_to("/movies/#{@m.id}")
  end

  def delete
    the_id = params.fetch("mov_id")
    matching_movies = Movie.where({ :id => the_id })
    @m= matching_movies.at(0)
    @m.destroy

    redirect_to("/actors")
  end
end
