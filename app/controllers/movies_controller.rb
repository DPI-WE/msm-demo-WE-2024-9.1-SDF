class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show edit update destroy ]

  # GET /movies or /movies.json
  def index
    @breadcrumbs = [
      {content: "Movies", href: movies_path}
    ]
    @movies = Movie.page(params[:page]).per(10)
  end

  # GET /movies/1 or /movies/1.json
  def show
    @breadcrumbs = [
      {content: "Movies", href: movies_path},
      {content: @movie.to_s},
    ]
  end

  # GET /movies/new
  def new
    @breadcrumbs = [
      {content: "Movies", href: movies_path},
      {content: "New"},
    ]
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
    @breadcrumbs = [
      {content: "Movies", href: movies_path},
      {content: @movie.to_s},
      {content: "Edit"},
    ]
  end

  # POST /movies or /movies.json
  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to movie_url(@movie), notice: "Movie was successfully created." }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1 or /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to movie_url(@movie), notice: "Movie was successfully updated." }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1 or /movies/1.json
  def destroy
    @movie.destroy!

    respond_to do |format|
      format.html { redirect_to movies_url, notice: "Movie was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :year, :director_id)
  end
end
