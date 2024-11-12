class AnalyticsController < ApplicationController
  def index
  end

  def number_of_films_by_director
    render json: Movie.joins(:director).order("COUNT(directors.id) DESC").group('directors.name').count
  end

  def number_of_films_by_year
    render json: Movie.order(year: :desc).group(:year).count
  end

  def movies_by_popularity
    render json: Movie.order_by_popularity.group("movies.title").count
  end

  def directors_by_popularity
    render json: Director.order_by_popularity.group("directors.name").count
  end
end
