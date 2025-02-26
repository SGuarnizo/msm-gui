Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })

  get("/directors/youngest", { :controller => "directors", :action => "max_dob" })
  get("/directors/eldest", { :controller => "directors", :action => "min_dob" })

  get("/directors", { :controller => "directors", :action => "index" })
  get("/directors/:path_id", { :controller => "directors", :action => "show" })
  post("/new_director", { :controller => "directors", :action => "insert" })
  post("/update_director/:director_id", { :controller => "directors", :action => "update" })
  get("/delete_director/:dir_id", { :controller => "directors", :action => "delete" })

  get("/movies", { :controller => "movies", :action => "index" })
  get("/movies/:path_id", { :controller => "movies", :action => "show" })
  post("/new_movies", { :controller => "movies", :action => "insert" })
  post("/update_movies/:movie_id", { :controller => "movies", :action => "update" })
  get("/delete_movie/:mov_id", { :controller => "movies", :action => "delete" })
  
  get("/actors", { :controller => "actors", :action => "index" })
  get("/actors/:path_id", { :controller => "actors", :action => "show" })
  post("/new_actor", { :controller => "actors", :action => "insert" })
  post("/update_actor/:actor_id", { :controller => "actors", :action => "update" })
  get("/delete_actor/:act_id", { :controller => "actors", :action => "delete" })

end
